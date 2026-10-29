Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793293048;
	b=5J7P+tkS6fghaqzdC6VSqallwa0MogYsq4AeFs0bPlcJwLEGbHzN9A2MWHnMbtuVBjyk
	 hNQHvVnOnPJoizbIrZaynU1yws9k5hNvKUh7OL8To21qj1RXuVnaptKPGcUiK683KD6h9
	 9zJx0732UwXSgsHADrsp8w/NPsvOamFcTyQZHAlLiSeeJWwyVBGMM+roEsqwxaDsavjdv
	 mF746BdcC+UdFZqvGqqVxZMrg7JnLhr+7PZlYZ+34+Y+9njtTFRgLLyoaZs+8x3ifJdbx
	 BOgRGVb/SQ2mxYmP0hTtScKiAX+2xB8M4GqGw6ZNrDTS/EWX3UoCza7YomcHuSjas+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793293048;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=me5c7m/qzPaBItKrxG31JKNm+LqR9airvuaWsfIyW/E=;
	b=HTm8U50Adx9tBfMpPAxVz2brt8VZLQQg3s2b6ZB6RHqBaMF96mZm5qF/nMYPSW2KNez3
	 njnRPHCPA65TPAWECEBgGEyQl1JA7Bh25lNmmI15A2wwXUrh9mkNYds+ZKcdn7nbu6QKI
	 Goig1+NAkZ1ZQNd6n9kTXS4HPmLia6St60CDHmnXh9V65HnGebQZX9DNwZHrWhQJWy66U
	 gFqHaYxbFGnje1u8dpT8Gd1VF+nFOr0XjbofI/cnmSRlur4TfMEGyk+3YdW8FXjsLrMdb
	 Geeyr1NNlqvWcIxvZgr7Pckyu4bGc3ji/0MLGP9HF8/yU4wOKngr5a1MzfNuCQXUFSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UievcfT0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SxtYZEG7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF396606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF396606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UievcfT0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SxtYZEG7
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDE8T1087036
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=me5c7m/qzPaBItKrxG31JKNm+LqR9airvua
	WsfIyW/E=; b=UievcfT0DQjO8FjvbPe1RKj08QapsD968FpQwzYlqJWV2/9ukGQ
	6vBzNSNLqJ9silL0CZCw4DCLWZAFiYyrJ0Pdo1RBZ5YFOHhLp452A6iK8Y2cAJ1z
	IkttFda9ZoOZQ5UTgviDWsDh6Xp+oe4VeygexGWCPgXsCQ1C3JClyl/oTRfZ9DbB
	U675GynJLwRTHqzoxb1Gsf4agGAOgK8OgceVtl6qmoGyAfZTgaq0TuSVKd7cR0aS
	uuPuEflWE5oHqycrzJzHZBytenUX1Snd6ZowrihMZEWLkYUBbzBzvwLITVqE4dgN
	UXb0M77CadJJV2DvRIfqW2ec0x0l/m2HenQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hktmpbw3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:57:26 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc36b97a77so605255137.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793293046; x=1793897846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=me5c7m/qzPaBItKrxG31JKNm+LqR9airvuaWsfIyW/E=;
        b=SxtYZEG7a0BSFuElUP6wYh+T4ooLhQN0CqnpMTmp6wSvhxqHVidPJ6GIpQgi8pRN1f
         TD1FDs7G84D6u7SP3/178Sz7bmUtmREfk3dpPvUI+Cbh8o4q3BtkkStE+DtNa7dCSLzw
         p40nJHmdBwdR/2p/iVxqexqpfllopeIbSm1rw7zn9kvQkfLbw2817nJqF+uuIUolWfFQ
         YC+roeau8u5gArYJtA0cImbFBdPx0Go6WzeqymcyvRy0qpNkXDrcTTpzs7YDm02RqiuS
         fKerR6D23t/S9tX1BDx/MwJ0l6WzWqDM9bA+tH3yDJNP8+JdLqxJPwk5wmx+cY2PuVX0
         +OyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793293046; x=1793897846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=me5c7m/qzPaBItKrxG31JKNm+LqR9airvuaWsfIyW/E=;
        b=ZpaFLc3qA3fi5ojiIz0eJ0vfIpxrtVxnc4ZlFvxL3tq27leAMwXRnQU6QKHMTV5Ty5
         DPNQBH9hdGwa94Dtp33d0s5891YFmyM7wp8sd1tW9hCNIwWay4SAMu+0pgL1kNl01Ovq
         L201AnEqvXLT4xu1NA3uVOd3VWSv1ynkwlsJyPS3cvekNe67qs+sv6jbh+ysumU6Qd3W
         GVihbnpVT+E8QJL50wBkl8bmNTol8mb0ERbdeIot7KckNAoJUUUkptJ8cKqbScBh5tkd
         xNG9jL0zPp0cfzWoXZuZgd1ONm3OG+aPvXXiFHSXJWGtNihlSwb+IAKjm9Gvy0qkKi6U
         pGnQ==
X-Forwarded-Encrypted: i=1; AKwUvByEf7jFuQwqGUH5U8KQ9oUr0H51pDbIc4UTSgEVDUXjB7oD49Nc2C2lYZLLOXcwKknIyXySKDmA/mfLla8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIB+PBMIfZp483Nw6spvXo3B25Q7C4PE8gJlY3q8uMxdNZ4fd0l
	yP07fXnneYYbrdYf+cmpV+uDPXfXyxmBtMKVxrfQPBZBEI5XN1hl/eut5y8xebtjPhW5Vx4TlHj
	AZg8DAZDU5fF4T807Mb0XsJ6P7lZDXiqDRqYcLVskj3tFE6TaYsyn9MgyQ/HejKv29Ro=
X-Gm-Gg: AYBFou2xBzkBiR+peMQsTSL5/oR1u4zPPHnoWPmEkRMctibPx1C7PtkPphO7SGOmlZ2
	bf0ZC3/JFyOux4yb8Az+21J4nQgOCRwMV8nN8NffBTVxW4SQfq3mhN33SykZU2Su8ah5t/RWbWa
	50K1GD9VxA10hGRvPpvFtTsuwUyV6OUTpE80oDHbE4zudAXZ+go9nksA/q5Vr3GkUaU0vzuH4lr
	hr9nqYKSCM6CV+7REzI8RFNk0SUMAtaaUDqJchrqR/sItJ8soMKynK6lcRZfY/Lm3FxbKs//XAX
	RQBTVo0j+qUxBxU+TjYDWU8e6JXsWxazSSpAzoj3dUjhs2eIwRNJ9Dj59LxeDrQvslH+lU9eyZd
	HFEPNPyaHm3vjoyD0QUJ+1W89BOAB5BamtDtHjsiqZFc4Tvy7lLKoVWbvIUx7lGpSY297AXJjJv
	8s
X-Received: by 2002:a05:6102:5698:b0:7bd:732e:c615 with SMTP id ada2fe7eead31-7d03a5b4865mr2521759137.26.1793293045844;
        Thu, 29 Oct 2026 09:57:25 -0700 (PDT)
X-Received: by 2002:a05:6102:5698:b0:7bd:732e:c615 with SMTP id ada2fe7eead31-7d03a5b4865mr2521743137.26.1793293045283;
        Thu, 29 Oct 2026 09:57:25 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:7fbe:151a:486d:a2cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df961dasm325669f8f.23.2026.10.29.09.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:57:24 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v4 0/6] powercap: Add generic hierarchy support and convert DTPM
Date: Thu, 29 Oct 2026 17:56:44 +0100
Message-ID: <cover.1793288783.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NiBTYWx0ZWRfXzCnkvZpsvAtH
 mH1V/0lAgAFWL+K105C5RSXrKHsNiMOtcoUNd0J/8+m2sW9mHouN4nogkxrAdoowa0AmP3Suz/f
 WVOXZUxTtE9jCBFTmzGVVGJTbq0YjCozF/HM2e28CYj5+iwjWhAg18oYTgoiC8ok1S/9oICqovK
 lfRBi807vW/CVX1JLgAc3B6FwYyLTicayMzx0ku7u5eThkugM/1NUwEBmrEII2paV2Fr7aGVHwJ
 2/glUmm5bVuv+LYhEcvpsxzaMMvYyiJ6c/gR32ZzruRK9exRYvHJWYnTxCMGSYcxnUvRmvHlmFC
 2FL1lMu3+llDCyh/t1to9k335DvLHfJlGEPB3iEu9QO9f40qHKBA+NcDGOmTY+GFvmMFm2w6bUL
 szYe0IPGGJpS5KDiE97hTbGRWMoOJA==
X-Authority-Analysis: v=2.4 cv=crYOAF4i c=1 sm=1 tr=0 ts=6ae37af6 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6LeHEQr_I3XcUWd-WmkA:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NiBTYWx0ZWRfX98AFpD1DyYz/
 SgjyWKtxm0OIPsc8q+prWCRTlv7dKF1QTB/IXe471yY9AxAc4ahhxh0bF6TOL+g8hqLtDyMzx3s
 hWXNMQgK9fIl0rSHTowQ8xGuok2Hw9A=
X-Proofpoint-GUID: 5FpPONMk6x1EGowetfymXiTnJmcVEaef
X-Proofpoint-ORIG-GUID: 5FpPONMk6x1EGowetfymXiTnJmcVEaef
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0
 bulkscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290066

Powercap controllers may expose trees of power zones, such as packages,
clusters and CPUs. This series adds generic helpers to duplicate a static
hierarchy description, create its zones through backend callbacks, and
destroy them in reverse order. Parents must precede their children in the
node array; the helpers validate that ordering rather than sorting nodes.

Drivers supporting multiple platforms can place each platform's hierarchy
description and node array in initdata. powercap_hierarchy_dup() creates a
working copy of the selected hierarchy and rebases its parent pointers.
All original descriptions, including those for unused platforms, can then
be reclaimed automatically with init memory. Names and backend-private
data are not duplicated and must remain valid for the working hierarchy.

The controller supplies creation and destruction callbacks to connect the
generic hierarchy traversal to its backend. The creation callback receives
the control type, node name, private data and parent zone, registers the
zone with its operations and constraints, and returns it to the helper.
The destruction callback unregisters it during rollback or teardown.

The API supports both fatal creation errors, which roll back previously
created zones, and optional nodes: a NULL callback result skips a node and
its descendants while allowing independent branches to be created.

The helpers were motivated by the SPEL work and also let DTPM share the
same hierarchy infrastructure:
https://lore.kernel.org/lkml/20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com/

A kselftest exercises static and duplicated hierarchies, skipped branches,
reuse after partial destruction, and rejection of repeated creation. Its
userspace script checks the 16 exported zones and selected attribute
values, then removes the module with a sysfs attribute descriptor open.

DTPM is converted to the generic helpers while preserving best-effort
creation when individual backends are unavailable. The CPU backend finds
an online sibling when a hierarchy's representative CPU is offline.
Entirely offline policies remain unavailable during initialization.

The RK3399 description is reduced to one CPU entry per cpufreq policy.
The old backend already suppressed duplicate registration; the extra
entries were redundant descriptions, not additional registered zones.
Finally, a shared Rockchip virtual descriptor and an RK3588 CPU hierarchy
are added. RK3588's three frequency domains are represented by cpu@0,
cpu@400 and cpu@600 below a virtual package node; no GPU zone is added
for RK3588 in this series.

Changes in v4 (since v3):
- Rebase on v7.3.
- Address the selftest issues reported by Sashiko:
  - Add a kselftest config fragment requesting CONFIG_POWERCAP,
    CONFIG_MODULES and CONFIG_MODULE_UNLOAD, guard the module build with
    CONFIG_POWERCAP, and skip building when prerequisites or Module.symvers
    are missing instead of failing at modpost.
  - Resolve the kernel output directory and pass absolute O=,
    KBUILD_OUTPUT and module-output paths to Kbuild so cleanup works when
    a relative O= is inherited from the parent selftest make invocation.
  - Keep the statically initialized mutex in permanent module data so its
    lockdep key does not point into freed module init memory. Retain a
    separate init-only description for the hierarchy duplication test.
  - Return KSFT_SKIP when powercap sysfs support or the test module is
    unavailable, while retaining failures for actual module-load errors.

Changes in v3 (since v2):
- Rebase on v7.3-rc7.
- Add POWERCAP_HIERARCHY_INIT() and document static versus duplicated
  hierarchy ownership and lock initialization.
- Explain how duplication retains the selected platform hierarchy while
  init memory containing the original descriptions is reclaimed, and
  describe the controller callbacks and their arguments.
- Reject populated hierarchies with -EBUSY before invoking callbacks.
- Validate names and parent ordering before zone creation, including for
  static hierarchies; document the accepted hierarchy structure.
- Use explicit mutex locking, a signed reverse-loop index, and the clearer
  powercap_node.zone member name.
- Define NULL creation results as skipped branches and retain rollback for
  error pointers, preserving DTPM's best-effort behavior.
- Handle offline CPU representatives through an online policy sibling
  while holding the CPU hotplug read lock.
- Fix selftest output-directory handling and module cleanup, use
  powercap-owned zone allocations, and keep shell validation/counting in
  the main shell so failures propagate.
- Extend and document selftest coverage for static creation, skipped
  branches, hierarchy reuse, -EBUSY, and an open descriptor at teardown.
- Fix indentation, __initdata placement, unnamed setup callback arguments,
  and whitespace-only lines reported by checkpatch and patch application.
- Correct descriptions of redundant CPU entries and actual sysfs checks.

Earlier generic hierarchy API and selftest submission:
https://lore.kernel.org/all/20260806110159.69690-1-daniel.lezcano@oss.qualcomm.com/

Daniel Lezcano (6):
  powercap: Add generic zone hierarchy creation helpers
  selftests/powercap: Add powercap hierarchy creation API tests
  powercap: dtpm: Remove duplicate RK3399 CPU hierarchy nodes
  powercap: dtpm: Use generic powercap hierarchy helpers
  powercap: dtpm: Rename Rockchip virtual node descriptor
  powercap: dtpm: Add RK3588 hierarchy

 drivers/powercap/dtpm.c                       | 177 +++++-----
 drivers/powercap/dtpm_cpu.c                   |  62 +++-
 drivers/powercap/dtpm_devfreq.c               |  22 +-
 drivers/powercap/powercap_sys.c               | 204 ++++++++++++
 drivers/soc/rockchip/dtpm.c                   | 129 +++++--
 include/linux/dtpm.h                          |   6 +-
 include/linux/powercap.h                      | 205 ++++++++++++
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/powercap/Kbuild       |   5 +
 tools/testing/selftests/powercap/Makefile     |  46 +++
 tools/testing/selftests/powercap/config       |   3 +
 .../selftests/powercap/powercap_hierarchy.c   | 314 ++++++++++++++++++
 .../selftests/powercap/powercap_hierarchy.sh  | 128 +++++++
 13 files changed, 1150 insertions(+), 152 deletions(-)
 create mode 100644 tools/testing/selftests/powercap/Kbuild
 create mode 100644 tools/testing/selftests/powercap/Makefile
 create mode 100644 tools/testing/selftests/powercap/config
 create mode 100644 tools/testing/selftests/powercap/powercap_hierarchy.c
 create mode 100755 tools/testing/selftests/powercap/powercap_hierarchy.sh


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.43.0
