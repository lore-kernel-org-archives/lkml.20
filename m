Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218695;
	b=PimlBAPeBfhhBjnQU+d8NDodNKEClgh63mS9IgirmmTVrVxfgbj3etPmJ6qZ6J793zsU
	 s6Ty90zkymhMsYRz3j9vC2Fw5toQluf8zVpe2awNTlLHTmcNUUK0WHO0lLRFAtX0jHlFD
	 /KJSBqe7S6FrnAv9XDitBorHrjynRjhhE+LOelmtNdEKNNBwl0YKFuYa119aQHBWU1yb0
	 IKSezcMpyi1SMCBxCUzj6YgEBBOMPB1/kcRPMta9qPIq/9NdhvtfTQCTlhCQj3hCkkF2x
	 rOZP0x04OZ9cihDl/0J/0sm0xSiFuF9a0/eRUouDKSZqNieWZEUU1iJQMKkCpQGKYXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TwcEd9hq63L/MyMr6mqXIO2VREbB+2vU/8nc1EkdGyQ=;
	b=fVe5dmji2FGO1IVKhT81A/qYEupk64RsRUuVF1FivU6/hk1cOeh1NkfAcwo1dpMQdeVu
	 8EXJVocP9pv+axx32X4M/ximQfuScetKIP7cQIyYQ+IT6Jyl++V47VxR5z3oPzs3nbVWg
	 GoNTRyhmhIxmjZNAox5ov5acwR9N4Xhi2PI4rOMXxSwJ8k1C48afNXTHi8Gi+1AnGDSUM
	 iO1J7ujpN69Rdww42I6ThxgBbUhkPBxtQRPiD/qkQkh7c1qT6ZC053TCXNVo1ed4uMLHw
	 5QYdV8qiDB88rimb1pMQ80m804IR0bt5D+MVZv4NB6yQwT5QrlC09RJgPl9FLHW2bgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t7Enl3X5;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61D3606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E61D3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t7Enl3X5
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36f6295304dso775832eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794218694; x=1794823494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TwcEd9hq63L/MyMr6mqXIO2VREbB+2vU/8nc1EkdGyQ=;
        b=t7Enl3X5kTALh4nfTW8Scxn/lbAgkhV8oKzFWRGakf0XIa/GEOyRgUQFpOvUefexAv
         bTU5GesXjrWZveB+4bEKyYmX7yp+wGc2F6+KUfV4HB2y/bU9ChmuPuYin4l4nXnyUCBu
         wb27Khg0SutRdG+12L6Ny//p8GUIfUPRwonDqz7OvqrpSfxdDE38PfrExL9T78YiO6a+
         9b31j1+OZZlYQA7DM+lGgapKe1fr8iuR3IYB50CqWgTAcWvE4LY7f+GQOUV/PYpyvsVy
         I/R+vhOcLUkNH/MGya+pAx3fU2H0LrbLPXxoKal+DxSEfAbT3Skp26RVs0RrfMEYuFvc
         DeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218694; x=1794823494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TwcEd9hq63L/MyMr6mqXIO2VREbB+2vU/8nc1EkdGyQ=;
        b=EYxrKZQpyNE4kxioM8BLODK1g8SAkB1c420qzzR31w2OsTI9Yl4OVS7gjwwpw6TYAh
         c4SE7akfKWu3B3C64DrgR9BXvnIdfG4jTAPqdA8GYfB8OVpgNEleGRdaegkHlS2W7eGU
         5lkvXhWDJ08Fn+h887SyQ1hhPREtwhhQFM3JTcEuDGZzrppJVF0EHl05kWQxDxFzPKgg
         jeMcJm9WFgFQdlbeAPb9qNL+O58TfKp2knRdI4aaUi1wS9j7O3eNbR86zPniA7eM9Drp
         D9hOk4IgCL5QP04KPw64+vEqV9cMFmXrC9xz+c997JnNpOofjbZ/0AC7a5U+foHdEh5b
         16cA==
X-Forwarded-Encrypted: i=1; AL+hErEYJCiKBcJEPMi7FxCK+ShVYCM95zECqK9sCqZ5A/W5oZVgC65iXowsSmQhOXEpdFiau0vtH1aGLIAc3I4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jahAbiqOCG9z1dg1EecTSYQ8Ff/ZQ2N8OnTzWPCLjkz2IqyPu
	MbL4cKguMfrxWo01n9fU2lvwI0rHPnQb1vNT56cwFgV/ABouQUpVAqQf
X-Gm-Gg: AYBFou0LJHFhOaranF4FAvHThn6RQuZ41cyz/P5aCq84IfDbk+fIeAwJPZqT4NeExqP
	3pcU38Rkt9AVMGU8upkCnEmORmgrQZjbvem1RzkZzdOZvoX8sw5WLmmVtJnLJvkZ3FlqsZgN9iy
	ORDYRl+Lj3x4anxQ4g3ICwGhIox5xOMPdeCr5Lo4+TknRbuDDViWhB8jPesLfvUe1H90eHkj84h
	qP5PlxWhbUijbgdKIc6lecaYAMfbm5x5A9Ehk973oEB3sRPQlLtYABZE2qFW0eMH080+Zdtd+yo
	Y4mRNDcvEszc0MBA1kTPc2ZzzAhZAzrY9LyGYJYCqbLbwaVkVSLhLb/YM5/i8CjuNjBgFqoGAX7
	m+kx0MGBK8Q1KXb4tzBeNOMPlTxCeS21H4T23GU9/E97hE3DKT08RxdcD3OzaWvBjIjLiysaaLd
	luUbfgF9Y8fgG0/Q9o2lIoDEKjvblhn5WjFHl+cZMsFlmsCd1vs1FU/xnCGz3vWxzEH+6zcnuhc
	gt4lznKZMMNuz8F1LaonUAfkkJMFE7eTuQhONK5VqiL/I4tJ7TZGirEcCj3FHjsK+ALzHHzF7H2
	46LuVzbBYN9mv22flu4G7I2CTCr2IjZErHR9gIKfz0DR8iAYwR74ML8njSVk1b3TkA==
X-Received: by 2002:a05:693c:65d7:b0:361:6884:78b1 with SMTP id 5a478bee46e88-372570dea1fmr6321547eec.28.1794218693919;
        Mon, 09 Nov 2026 02:04:53 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:51:5a62:c2b6:f9ff:fe77:10a0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d60absm12886710eec.26.2026.11.09.02.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:04:53 -0800 (PST)
From: Amaan Cheval <amaan.cheval@gmail.com>
To: netdev@vger.kernel.org
Cc: joshwash@google.com,
	hramamurthy@google.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	bcf@google.com,
	jordanrhee@google.com,
	przemyslaw.kitszel@intel.com,
	maciej.fijalkowski@intel.com,
	pkaligineedi@google.com,
	maolson@google.com,
	csully@google.com,
	willemb@google.com,
	yangchun@google.com,
	npl@google.com,
	awogbemila@google.com,
	shailend@google.com,
	nktgrg@google.com,
	maxyuan@google.com,
	bpf@vger.kernel.org,
	john.fastabend@gmail.com,
	hawk@kernel.org,
	sdf@fomichev.me,
	daniel@iogearbox.net,
	ast@kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Amaan Cheval <amaan.cheval@gmail.com>
Subject: [PATCH net v5 0/2] gve: fix RX page refcount overflow with the pagecnt bias
Date: Mon,  9 Nov 2026 15:34:35 +0530
Message-ID: <20261109100437.331423-1-amaan.cheval@gmail.com>
X-Mailer: git-send-email 2.49.0
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

gve's GQI and DQO-QPL RX paths bias every RX page's refcount to INT_MAX,
so a single get_page() from the stack, e.g. splice() of received data,
overflows it: splice/tee fail with EIO/EFAULT and GQI can reset the
NIC. Patch 2 lowers the bias to USHRT_MAX, as other drivers do.

With the smaller bias the driver gives up its last reference on a page
once every USHRT_MAX handoffs instead of once every INT_MAX, which is
only safe while every consumer holds its reference until the buffer is
recycled. That is not the case for an XDP_REDIRECT from DQO-QPL to an
AF_XDP socket in copy mode, a path the driver never meant to support:
commit d8a8ca14c937 dropped the queue_format check that used to refuse
it. Patch 1 refuses XDP on any queue format the driver advertises no
XDP features for, which today means DQO-QPL, so patch 2 depends on it.
Trees before 6.17 still have the old check, so there patch 2 stands
alone.

Harshitha mentioned on v2 that Google would send a patch blocking XDP
on DQO-QPL; if one is already in flight I'm happy to drop patch 1 in
its favour.

v5:
 - Patch 1: check dev->xdp_features instead of queue_format, and
   reword the subject and message around that (Joshua).
 - Patch 2: name INT_MAX in the subject. No code change.
v4: https://lore.kernel.org/netdev/20261106114551.212675-1-amaan.cheval@gmail.com/
 - Add patch 1/2 blocking XDP on DQO-QPL (Sashiko).
 - Say "overflow" instead of "headroom"; use USHRT_MAX directly instead
   of a macro (Maciej).
 - Say which trees need patch 1, for stable.
v3: https://lore.kernel.org/netdev/20261103090651.35399-1-amaan.cheval@gmail.com/
v2: https://lore.kernel.org/netdev/20261102112613.18334-1-amaan.cheval@gmail.com/
v1: https://lore.kernel.org/netdev/20261031173449.2439047-1-amaan.cheval@gmail.com/

Amaan Cheval (2):
  gve: refuse XDP on queue formats without XDP support
  gve: fix RX page refcount overflow from INT_MAX pagecnt_bias

 drivers/net/ethernet/google/gve/gve.h                |  2 +-
 .../net/ethernet/google/gve/gve_buffer_mgmt_dqo.c    |  4 ++--
 drivers/net/ethernet/google/gve/gve_main.c           |  6 ++++++
 drivers/net/ethernet/google/gve/gve_rx.c             |  8 ++++----
 drivers/net/ethernet/google/gve/gve_utils.c          | 12 ++++--------
 drivers/net/ethernet/google/gve/gve_utils.h          |  2 +-
 6 files changed, 18 insertions(+), 16 deletions(-)


base-commit: 21f57ec673a1917547c808cfa81890485fffa03b
-- 
2.47.3

