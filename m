Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794454210;
	b=j6B1LioeqMFfp+MidxTdVFwl772QOtEWKkJnp8hhUfEwOtLgHpoJ3SPjMfu0tOflp96T
	 1/QphEx7DEOFYBZGuGxToFO3yAiOcDVBQcqeh/QIBbLX7kOWZ+436Zjbz0ttEMSvx/t01
	 yw8QvdB9o1gcA2I/RaRUVU1D7xH+bV7EQj+ATxNWA7K0M+bEtIJs80nnrbKNxnH9lLqV0
	 KB3nJkpswDCsWZaoDEVrdgmXfGmavpon5Zx/wBrxj0z5HLGsBeDqzh+1mD8MmNastxxjT
	 hRpgPdCxmKo7oZDgbziPT3SE5AbbIxfNbBUFTIDs1+HoElBQ4IW/UszJY2F5Bl6zyvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794454210;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=bgGQOwFOk0Aa4x0K0E9YvcghK9Nli22UrljjDODslcc=;
	b=gPEH4GZAYR40By9EoI7vBk1YC2RXeNTBRMwUV2zFcfO/IrV6wFS8VENiQp1Aq2+gTthZ
	 5ZmLjeFdTo1KZY+RluNeJpSUTwTX76fVol0M0iSmM+PLif2NreXa8YJ9OrdNWAF1fGQRZ
	 dVVLjgRMAht5JcskI+C031pxDdvj3AkN/UgArLWKw5YqC50GuREQWeMXTNsO+LaLI6F1r
	 /QBLK4pKSkowQbq8IAB94Ajiy0dFHJ4eBBCHLEQ/nEii6A4LqHHh+NHiI3X4427QnoSzQ
	 becTsYkiedZnjy7xkQ+hV3d4OU4dIEFHNWQxULY8qxSyhidlPwMc+auRaJEKEV3ODZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jmU8Qr+X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12E9606A327;
	Thu, 12 Nov 2026 03:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jmU8Qr+X
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794454210;
	b=W3iXgai+NcODwwdoxaE87ux/aPTtDExt9xXtusuo881tE6wXRsw5YiZWjLdQV5H1VwOC
	 P1NqSEBDdOYBpL4UX9T5P0IxDcbbM8EVwPN+MirFnPvKMre7+vM17GpHWc7I+i0yrMe0D
	 mgFMOrs8CDTXuE4rHrXcgLU/Go5EXm96+IO97rzflW7GAt/EzGvQR7xQ9xrYIvdaYwiub
	 Jilk95mTa4ePvDTSHZbyBivTUe+OMfJ1P8gbNpWDakdhnqhbLypSKYyZvbN/o5SyUGYPk
	 /3OtcoqmG7ocBpaKSTzi+0s00F7oI90hiQAhNAmXnwEd5+FAUFMjZE1fSLRZb25dDzw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794454210;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=bgGQOwFOk0Aa4x0K0E9YvcghK9Nli22UrljjDODslcc=;
	b=pl0DWMgRtqTL2H0zTwx/BZY91flR8dyFROYrY7Q6EqI0FwopTeMA32a83eadGpfSMIzB
	 iFKcT9rZhwXwpRJrRXvwG7Mr7/HoZ4Lu2i5yiy7uxjEY/C9uH4mWBA89lqL+r8qorusV7
	 Q97OrBBsibHw0ellsBKYVPBeqquYAHoffuldldQFlWJX0msoj/AO7lFnHpGtU8l275UL1
	 9+ZJpjJwrFQDKk6UJkFxxCZ6jmEo+DevQlWpx53iKHdaRxmgpHUy0GM0mIomfn2Mcp9aX
	 vELVGBhoMY2CKg2AcuM+Ii2p5qruZccFc5FDaBDTl2w2NeA2NoCmC8YD4CLy0YPtlVQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ADF831F00A06;
	Thu, 12 Nov 2026 03:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794454210;
	bh=bgGQOwFOk0Aa4x0K0E9YvcghK9Nli22UrljjDODslcc=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=jmU8Qr+XAN3J9a7A0nhyCJysigUWIWfmtdnyHuV+dXVkolBsKVeKg69ZfddEoteQ5
	 DueOB7jsQ4kn21J5oldUccJYEfFN+8Ps6HXbUOSbjBH3Vp0EBw10CHqp49Z8JaT+9a
	 cuJY7zlw0rDKh8fLCO4WuBE36+nCQwAt16kHILtdG8WIzN7sL2pZb6o6BYA7Fqwr9O
	 lowHChCEsMCKMUkAS8nFowHIE9p6FwmLVGmAqgY+UicJiEWBnpNx8mwf3ZarIpgfkm
	 8PyKPP4LcPDEXm+7aLJbnNOoG2tO2QLtadyi85W+y/v86Sf+KZYKkGSt1sLY67FMQL
	 99rCbl3JCAA0g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0CFB44923C;
	Thu, 12 Nov 2026 03:30:09 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Subject: [PATCH v3 0/2] staging: octeon: fix probe error path and
 pow_send_list matching
Date: Wed, 11 Nov 2026 21:29:56 -0600
Message-Id: <20261111-octeon-init-pipeline-v1-v3-0-e5581974fae4@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7Zi2QLWuvIdhgXWASaBtWtJoC
 He3cgGTv3k/+e9vkCgyJbhVG0TKnNi7AvWpAjv1biTkV2FQQmkpxRW9Xck7ZMcrBg40syPMEkm
 1ZHUzNIZqKOsQaeD3YX50hSdOq4+f4yjLX/vfWSKQnspqa1qtLuY+Lj3PZ+sX6PZ9/wKyG1pWv
 gAAAA==
X-Change-ID: 20261108-octeon-init-pipeline-v1-e25ec64f49e3
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794454208; l=1128;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=PijAdS24DSrt7xT4IEtyGgaWqpoeAF70HEZmMy9AdhA=;
 b=+jJNtraHj5wgm/m6oXx/umJWMJZWKSOEjQA6rHckRVEeZI0awqH3L4CjDQU0QJAuN8Am2VXfx
 0ZMH5bBEsPMD8HdVw47QYUgXNqUWbXtElud+Dvn+hZZQX8a8fCGRrsY
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com

Fixed two bugs in drivers/staging/octeon/ethernet.c:

1. Call cvmx_pko_disable() in the cvm_oct_probe() error path to match the
   teardown sequence in cvm_oct_remove().
2. Split pow_send_list on commas using strsep() instead of matching
   substrings with strstr().

Oscar Alejandro Sánchez Lucero (2):
  staging: octeon: disable PKO before device removal in probe error path
  staging: octeon: match exact interface names in pow_send_list

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
Changes in v3:
- Drop the ndo_get_stats64 conversion patch
- Change commit description.

---
Oscar Alejandro Sánchez Lucero (2):
      staging: octeon: disable PKO before device removal in probe error path
      staging: octeon: match exact interface names in pow_send_list

 drivers/staging/octeon/ethernet.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261108-octeon-init-pipeline-v1-e25ec64f49e3

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>


