Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208237;
	b=MQnw9VVBT7Azi1/14eKVeDl6/mmFLO569iXk3L2IryP4uKrbwVZIwCLiU7iJ+m6p6nYW
	 xG1JvT8i/hPohtxEni5YuuA+JKwbCMwxuUqr8dDeTkPbZTPFgyYwvfIMqvUF86alQR8Fd
	 bOGB6fqncwko68iouy2aGpOFtoPT9u1RAxg7c2+LnVP6zeq50hx8eKpc9mRtSFX0Krmyt
	 EHb8L+sptF98f4UjXkuDac8tBymCSorAt91P7+U4YuJWp+GFQE/r5se9N8m0qFft4lwXm
	 oRdOZaEjqBt/GLu2OmwvAG3cjSzXyT4tlOPj1C1bRF+f/kjGFUDSP5iEzDWqFcOlfAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qMu+E00+xLkfpIW7uvacAeDC12OVnUmiLpjE/Y+qhVQ=;
	b=BwoHZ4QeN3XNeZhWrtRAer8eKKRRET4GCgQqx7u0NeQbzeZexbqb+E9P6KYr9tfOTS3q
	 WUUB9zARZ0q1eeZoCmcpXFf3Vfrj36aO+RMuxqIX18BHRfpXI8ls4w3O/fCNetn9XCZ8y
	 nBehY4H5RYbSCwCNHiANxrGcsIznHhHSYTja1edz1HsO7vPq12iBhr6LAs6eF+X79qxxf
	 1J74Y+E/sAT9xvT+vVoCD0SakJz95rdRr9ivEMGC1QqIv2Hi1CdSxdjtCBQFqayP8l1yu
	 UCLemIKsvuUC3ziIWYIbZkRtKvVh0IFM+XJLHnmhztdRXr1ssmgwCGha9/SQM1D9LAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N57GV0WI;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AAC606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6AAC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N57GV0WI
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37000e7234bso1791401eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794208236; x=1794813036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qMu+E00+xLkfpIW7uvacAeDC12OVnUmiLpjE/Y+qhVQ=;
        b=N57GV0WIWarWe3ZrYQQvE6FGtouwvf0dlkbJO492VMsz9IM9FmnXH6L78Hqel1qF6H
         IPTMmSalKejGbC8ehdfpK0qEdGKyViWoTij3Lz8eAqBwiBHb9kTZilsqmX5Ex7DJu1gf
         DMQI9x4p0YY2nOYnthUt6WRSFp60B59bcozRolgKhVosh9JEB8RkGeQiD4y7WRYUYlv1
         OAxduc4g9dUu6gBXqpEUlPIYPrjm0dfP/LcaHY8dQ95XH3P1snUqlx1fiyBduB43x+n3
         p0Ths6cpvC/zDADpFqJ9rm4OA8NBlf4D/zf+YUoBB+MAjFisBkOx1NPzdGUZ3iUoYHuO
         05Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208236; x=1794813036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qMu+E00+xLkfpIW7uvacAeDC12OVnUmiLpjE/Y+qhVQ=;
        b=T7+Ihvqq+TxxtKpJXKkMwn4CWnxI5QFR888xd1hJ1UyrJvQh6bXVVuUqSTcbAcTL5u
         Nnt5SDs2113VF5tTQ+LpxDHXunk5W0PESJGcxY/LViZKTNwkk3YZaa4fQM5luylcVJOm
         8JDP6v0cH/X8lq1iqtfwCRR+5LDSSlcMeQpx76oMs9Gj/Qtbx/+uPzr0KieQ/6r6CNMG
         4Ua+QhBPHCXP+IJ/o8S3UREXA/xUUCn7hfO7THwSIodEdEitrKDQISaHmduFgp7ejSik
         P7/tYPVWdMJWpkU4i6aQIvEa502ruPCCIv5l/BBE4o9OyxpsSJDtozv//KifaKY2kPkY
         DbYw==
X-Forwarded-Encrypted: i=1; AL+hErHjUSBdIOG2qeYomMKaQKknK9K1jJ7Hat1jtLjloUKNVEgsjLf4SFnmK5qjBvhH+EKC5Fu8Mmd/ulv0vGY=@vger.kernel.org
X-Gm-Message-State: APuU4Z953zU7HpnNxZ3Cy/2PYtmb9/DN2Ohdu+bgjxKMmiXpZ4vdHp8a
	2Cq5nmUpRucYLaIpNP4etN943/PWfzujhw3/tSDlsNUfixiph4Ccad28
X-Gm-Gg: AYBFou0eYZFhaQjBbmrjLpIotd6goTqSgIGQP7zs9rxmf/w7Nba2UVQCWtdNpcJrdd8
	7jRgOkoOAU2r4Oc4eVpmN/xSiQb21GwsWrg4IoPZUkUhpxxM+n7JdB5KhikdsiqRH/4Ug60YnTZ
	TzFFaikIDvHun73uhThmPrsATwhVUCYnDfitAJC4z/Hw53hWU2g/Qpdh6eMvDIQeXF41Q814uq7
	N8sSjmOAqRIvfM0FxAzcSXn9Acikp+m/USGjz3+rwuPDtKUOosWNXuQERPB7Ps5aGbjVeNpcoa8
	r1aVeVtf5qoiQhBFrHGGqHYspGp0Mxmdu1gVsqneSAUVliMjGhAUJCgh3QfAZrHumUpFgP93aXu
	FexT8NGNndMZQDz+sYxCKO5uKVCgtlPd0TJy9AL4wvQGViLm0dcVa/52cYYDlJrdtY9Fxwq1RER
	DwQD+65BFOBumC5bOVaVX3mWXUg5810FXQ1GK71xzQ93mD19rJ4/m/9N1FwPI+f8s8j/9+TQw5W
	pkT8T+FVZ2NENY1xmsVm9B4A5ttiZN54iWCsGaH1m2J3YS8BxdaHKIed9T/rqwZTrdS9L2M7wFm
	ni/mDLJFtbHONOgCcf11B2mFSV42mHRH1vlWzOiQutUHC5X7LxJESMT4urnGweZzTmoO0qHvHD8
	oXVrlGaAx8VU5CkeQX6BigV3Xks7oEdhpqA2di2ewQbIfWO2hOw==
X-Received: by 2002:a05:701b:4558:10b0:1b3:a9c0:6a3e with SMTP id a92af1059eb24-1b3a9c06ac8mr3048889c88.29.1794208235645;
        Sun, 08 Nov 2026 23:10:35 -0800 (PST)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:cc96:e14b:76e:f8f1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755eb6efsm13443513c88.4.2026.11.08.23.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 23:10:35 -0800 (PST)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jiri@resnulli.us,
	jhs@mojatatu.com,
	shuah@kernel.org,
	donald.hunter@gmail.com,
	ast@fiberby.net,
	toke@redhat.com,
	liuhangbin@kylinos.cn,
	j.koeppeler@tu-berlin.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH net-next v10 0/4] net/sched: sch_fq_pie: add per-flow class statistics
Date: Mon,  9 Nov 2026 12:40:13 +0530
Message-Id: <20261109071017.438478-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FQ-PIE runs an independent PIE controller per flow but exposes no
per-flow statistics. This series wires up fq_pie_class_ops to expose
per-flow AQM state (prob, delay, deficit, avg_dq_rate) via
'tc -s class show', following a similar pattern as FQ-CoDel.

This patch series is accompanied by a companion iproute2 patch series that
will be posted on net-next as well.

Both the kernel and iproute2 patches can also be found in GitHub:
- https://github.com/H-N41K/linux-net-next/tree/fq_pie_class_stats/
- https://github.com/H-N41K/iproute2-next/tree/fq_pie_class_stats

---
Changelog:

v10: 
- Update Documentation/netlink/specs/tc.yaml for fq_pie

v9: https://lore.kernel.org/netdev/20260928043358.6866-1-hemendranaik@gmail.com/
- Add a blank line between structs in commit 1/3.

v8: https://lore.kernel.org/netdev/20260922205924.32173-1-hemendranaik@gmail.com/
- No code changes since v7.
- Reword commit message to reflect usage of div_u64().

v7: https://lore.kernel.org/netdev/20260919060125.38063-1-hemendranaik@gmail.com/
- No code changes since v6.
- Rebased over the latest net-next tree and re-submitted patch.

v6: https://lore.kernel.org/netdev/20260917204225.275251-1-hemendranaik@gmail.com/
- Address Sashiko review comments:
  - Revert the fq_pie flows range to [1..65536]. 
  - Also drop the accompanying selftest 83be change.
  - Compute the per-flow delay with div_u64() on the full 64-bit
    nanosecond value.
  - Widen avg_dq_rate to u64 before scaling it by PSCHED_TICKS_PER_SEC.
  - Document the 36 to 64 byte xstats growth in the patch 1 commit message.
  - Fix selftest 83c0. The ping payload exceeded the TBF burst so no
    packet ever reached fq_pie, and the missing -W left the run waiting
    out ping's default timeout.

v5: https://lore.kernel.org/netdev/20260902035231.81866-1-hemendranaik@gmail.com/
- Addressed Sashiko review comments:
 - Omitted .tcf_block / .bind_tcf / .unbind_tcf from cl_ops (statistics
   only being exported; filter attach to fq_pie is now disabled).
 - Dropped empty tc_fq_pie_xqd_stats placeholder; class_stats is a direct
   struct member.
 - Limited flows to [1..65535] so per-flow class handles fit in a 16-bit
   TC minor.
 - Rewrote selftest 83c0 with TBF + fq_pie, ping traffic, and
   matchCount 1 on per-flow stats output.
 - Updated selftest 83be for the new flows limit.
 - Dropped the tools/include UAPI mirror changes from patch 3/3.

v4: https://lore.kernel.org/netdev/20260727164056.106203-1-hemendranaik@gmail.com/
- Fixed unaligned commit message; moved typo fixes to another patch.

v3: https://lore.kernel.org/netdev/20260630183702.170798-1-hemendranaik@gmail.com/
- No changes since v2.
- Resent after the previous submission was deferred due to the
  net-next tree closing during review.
- Updated corresponding iproute2 patch in response to review comments;
  kernel patches unchanged.

v2: https://lore.kernel.org/netdev/20260614125000.6058-1-hemendranaik@gmail.com/
- Addressed ABI backward compatibility issue for tc_fq_pie_xstats.

v1: https://lore.kernel.org/netdev/20260531125314.22492-1-hemendranaik@gmail.com/
- Initial submission

Hemendra M. Naik (4):
  net/sched: sch_fq_pie: add per-flow statistics via class ops
  selftests: tc-testing: add fq_pie per-flow class stats test
  net/sched: pie: correct tc_pie_xstats field documentation
  Documentation/netlink/specs: tc: describe fq_pie per-flow class stats

 Documentation/netlink/specs/tc.yaml           | 32 +++++++
 include/uapi/linux/pkt_sched.h                | 21 ++++-
 net/sched/sch_fq_pie.c                        | 88 ++++++++++++++++++-
 .../tc-testing/tc-tests/qdiscs/fq_pie.json    | 27 ++++++
 4 files changed, 165 insertions(+), 3 deletions(-)

-- 
2.34.1

