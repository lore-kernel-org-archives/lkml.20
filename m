Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649821;
	b=Nh6avit86wpT/3QJ58wY9bqq4B0YMabVFR/r+U3VvLbOpv8ybiVjsAzw8VweIQgP3rHe
	 hHer0znebI8dgxbbqre7eQYwLOAidrx2Rxb2nR51axEcTAbPm6wRy3Is+Froap2VUTitC
	 C1tm4bJpQ3O5tbQXlxscRaqJFTfMDWI0hi5ek8jEIGR2PEkbXisv7kecs0xXYxnFN9ygg
	 SNb0bulG0LzkfF5HnPcZcgRzD5i1D+/L8g83wFu+MgnJKXFM4VfIJKILAdH33DFtBQpA5
	 srHW19WngJLGnHb1qJ+DbdEGag4AfMjpiX8RTr5ec9+DV2hQJkwpuw3257U6DAUNT4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qDmRuiAok4BDh7Ywtb7KXFZfCX8FiUeWMjnaMHr+TlM=;
	b=PWv9L/YvISM/ZUxvKD3AuEBXSBxqJGjG992hWIXjQ4148654wDEAqnoSC52U0qcDUSHF
	 yBi32ekmhSus5S4Oga9/WEStvOvKvP4DIcZWszXuaHKVwO99TP3M/WmO0sxpsfP0vFrHS
	 ibztXMjrpD8DvYLVCW/+4pOOsACi1vsAMlq4nbKFj4FX+4m22cXR+KJDXcmykIpJiDlQk
	 LqE1lI6gMHzE8TwEaNiFaWmYzYPrf+IQIIutN166+0dzdFu5po6g4XOboHwVPvsKMWZnN
	 mDLmajUV8X2tULjqX269SAf4wwisghADwDI5Q/yU74TAkEDspN9mJjr9WG8o1G+Q1zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iy4Fg+BY;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCFE606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:03:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFCFE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iy4Fg+BY
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso1776804f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649819; x=1794254619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qDmRuiAok4BDh7Ywtb7KXFZfCX8FiUeWMjnaMHr+TlM=;
        b=Iy4Fg+BYUaijtdcG+0RGKvA4N02PAmy7Ct3XpBbFGTBlXQfUSoHEgF/hWqWLyPugRf
         cq/HRlLOw2dihG0EeV9jWTSryDT8wCOQSyBpcpqLwqgP5p6rpWgOKVfZKUqW0gx68EZQ
         SVKAfCT+LIzEKT+GV0HPGIx7mtZn8LZhhlwEFs7U25esXNfzKvbfHZkSt9pOysY8Dagi
         mM+cvQJaJfoIzWjBcJZKCEZyC11dU2GgZD9tRG5hNX6mB3uNsKoT7ik4EHM2TbP2mOdM
         FboNv37N2PY5Nmwkq+4MKBZiScZ1Zd6/qZ81zvuTCohBgNXAdV3UR5rqkh0suXxBaJgt
         3mnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649819; x=1794254619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qDmRuiAok4BDh7Ywtb7KXFZfCX8FiUeWMjnaMHr+TlM=;
        b=S2Nj2v+Tcl4ZYIKgE/9a7spVbJ48ChgcP0KFY9EzK9Ty7kUPqQedXXnkYBiiiC+mRt
         SkHtOEIfz84JGeSt2xE7uW5uBkywWWNEuCbIhNzMY6PmqDIIB9NlemmqEzdNyh57YizV
         L23i5/BuEOemLaMryrRNYYf+r+0EMUAG6z+Hqz3WJazhvKLPXrSWtpSTXVaKh9btz6hd
         72hfeg/HtNEtpdpWjrhMPTQqdfvSSBc85xu3r3FVPkbH0jBDtA53AW4plcdHwujAv1Mn
         LYqzaitfonWw6oKMVkaZfXbneTGWTPFbJCTYCMUM6i0Vo8GNYa7rGaNSxCvbRCR563QB
         CNRA==
X-Forwarded-Encrypted: i=1; AKwUvByjs1iNNdAEYA0nJugurGWz20Mr+RT1vClc8i1pfUsE4f087X81J8/SThjCbTeCQSKQg78/u31jL4JHrGE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mu3OkZv3+dwEEG9SIx6BErbaUHBjltCJM7TuqY1sHVCpzjZlJ
	pd69Cb/8KVRcraCGNNdIc4BiD+Ohzbg4VqFy/lLCWsXaHtgGHXce+05XHCZshJ8PQgMxug==
X-Gm-Gg: AYBFou2mo/zOzqWYMNi5sebhNdTMYo4Ah08UBB0BzMeIXbyGULVB63mDVSzjnXEDg5G
	M5nioMtBVIRxX85YugBkbW0h4YlmOo3+k+FRKfXaPEm7PzM0NP96ord6D0NlsaP6EkWcIk3S+VU
	Y2E/QoI0OpK+nc2fSlabil2qJquxiaA8FStaM6Bg31b8HsSfUkT++v1aRS6DFHlKpBLEBOnubOw
	bEiRFNO9GHXqrqEOAnEwbJq7kvqMK+WPhgzSOVxqsmVoADIkbm5jcO7i6xvNpHuiFx4wQIXe7IJ
	5FDXsnbaKjj9WAvEfWhiZMIPWL9YUrMYKcFw6QlC0WAGWuiaDs59mTcquyfnRS/3I0vecZs6/hW
	dYBXshlpkpnSy++y/OfJUXlXbTm58k1xma8poj9HwYZe5jp3/+w0gZiPi3ykYlJZpk0b0XOyVLB
	oGXXKO5dt46nRaFoTlCc0ihDo3Ojp/EW1856S9tsaMsteuS5QmV1UG7D1cZW2jyl8tihIzK+ajY
	OvYI26hpHhsaHK+oNtCphryBQJF7D6CXjWJDVG0qQkI0NX3Eg4wx7ua1yEHjsa2+IVaGgLnP2vf
	6ZHgs3DgiEzrS9MwOVB3XUroMOUg6qYS6l3eTuF3woK7kDN7LL0Bfgs31JQLFRJrdZ9Hy4iPQKA
	KF1wV/prB0/+KZuGNUKPCCX9VoqTvsGk665ZFfW3Un5VAlSoYinYmBOxJdZ3dffksINLNo2kY0Q
	idk0CzOM30YwU=
X-Received: by 2002:a05:6000:46c5:b0:48d:fd4d:7fbe with SMTP id ffacd0b85a97d-48e6e2bdf92mr17382937f8f.2.1793649819000;
        Mon, 02 Nov 2026 12:03:39 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (158-199.dsl.iskon.hr. [89.164.158.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9b54dsm21191574f8f.47.2026.11.02.12.03.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 12:03:37 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Nazar Mokrynskyi <nazar@mokrynskyi.com>
Subject: [PATCH ath-next v2 0/2] wifi: ath12k: accept what newer QCN9274 firmware requests at boot
Date: Mon,  2 Nov 2026 21:02:33 +0100
Message-ID: <20261102200235.48973-1-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
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

With QCN9274 firmware WLAN.WBE.1.6-01243 (the newest in
ath12k-firmware) the driver logs three warnings at every boot:

  ath12k_wifi7_pci 0000:06:00.0: memory type 10 not supported
  ath12k_wifi7_pci 0000:06:00.0: Invalid module id 2
  ath12k_wifi7_pci 0000:06:00.0: failed to parse tlv -22

The firmware requests the AFC memory region (QMI memory type 10) and
advertises direct buffer rings for modules 2 (CV upload) and 3 (Wi-Fi
radar), all defined in Qualcomm's interface headers but not known to
the driver.

Patch 1 answers the AFC region request with size 0, so that the
firmware sees no AFC region instead of one at bus address 0. Patch 2
makes the DMA ring capability parser skip unknown module IDs instead
of aborting the event, and stores the accepted entries contiguously.

Tested on two QCN9274 hw2.0 PCI boards (AP MLD on 5 + 6 GHz, and on
5 + 2.4 GHz) with the series on top of v7.3.1: all three warnings are
gone, the firmware reaches firmware ready, all links come up and serve
clients, and there is no firmware crash, call trace or IOMMU fault.

Changes in v2:
- Patch 1: do not allocate the AFC region, because ath12k does not
  support AFC. Answer the request with size 0 instead, and log at
  debug level. New subject. (Rameshkumar Sundaram)
- Dropped v1 patch 3 ("name direct buffer ring modules 2 and 3").
  ath12k has no user for these rings, and patch 2 alone removes the
  warnings (tested on both boards). The firmware uses such a ring only
  after the host configures it, so a host that does not implement the
  feature loses nothing by skipping the entry.
- Patch 2: commit message reworded and code comment corrected; credit
  Nazar's earlier version and Jeff's suggestion from its review.
- Rebased on ath-next a3ddbb457687.

v1: https://lore.kernel.org/r/20261030220824.915760-1-gsustek@gmail.com

Goran Sustek (2):
  wifi: ath12k: report no AFC memory region to firmware
  wifi: ath12k: skip unknown direct buffer ring module IDs

 drivers/net/wireless/ath/ath12k/qmi.c | 12 ++++++++
 drivers/net/wireless/ath/ath12k/qmi.h |  1 +
 drivers/net/wireless/ath/ath12k/wmi.c | 43 +++++++++++++++++----------
 3 files changed, 41 insertions(+), 15 deletions(-)


base-commit: a3ddbb45768717b5c9f923489387cf55c838d1ad
-- 
2.56.0

