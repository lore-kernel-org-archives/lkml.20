Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793419299;
	b=QgedC+YHN/JedTh7zfakuGJvKXmM4t3uoIYsLvnBdvKELTsHgeYvU4zw3y/+VisVhuhW
	 knOpSwLRFgtYqpnUfegggTvu4NQ3hxweGgQDY8d7e6q+XFcpoVjLoXbnV8V60ZFdxUXSb
	 Ywi9ik7IK8ME2drgQJdk4ABnzm4g0BNqybniBP2jD1qEW4v9EAYNen4sgGNk0Iwvwpxzw
	 XzjSWAGCpzpqH1/8XjFd9sI+CimKuB/XUHWv4uWpOlyDYzMgxo8Mtm9dLVOAaAXSZu0/A
	 VEYVsLvpYqqPNdMINUFoTwvX4/QVkPqeDHiRwnp80aM6ZhWVvanou6+ENdqXnKp/LKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793419299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qUjUqHrSOpVZo1vvK2oqewHli0ce+brsa+hIMhHohPQ=;
	b=xZ6IrXv78dN3S8ULXTmuc5ExTJ7795yKXggUQTJYFxF3Ir1e1ta49u9WismIxuzXeWcR
	 /kO+3YCOimhaieoYt7KznKdMwEp5d1y6wj8QEXZkDXADKodRGTZLdCUI4hPH4bhGJuYXL
	 zyPm1eyAEJ8A6YXGilcOq5Ra3xieCbO5djXJO4wJGKPvOh3Vl4219mY66wdggvo4GT8+B
	 o89COY8265+vJUtKZUUXkvJqsJBURJvbdNpALreVjvKPfR40UPyKf2mms5PAGNoe4PTAi
	 Bm8m2Lsgi8e5Li5GOLeHTER+T7ZqVas1hTPfYql8itnYox8yl38sz7TXqXKyulGGj7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wqge9KAB;
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D25606A322
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01D25606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wqge9KAB
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5eae12762c9so621408e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793419298; x=1794024098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qUjUqHrSOpVZo1vvK2oqewHli0ce+brsa+hIMhHohPQ=;
        b=wqge9KAB9WnywkU0JWNFXm534p+kI7ICrS1xkSHbYqhaPVxx5X4KHwhPs+sU9uea/C
         F3iJUjlQu3tzXSDcJKWkWXQAlFps9f1cB9TgJYTuRxOwUmNJtmnlFntU6ZAVt7ba0Mv8
         viMvk2bCKPMax6ed0i/ffUjW2HP2iG2zkADZ38GO2gpq+kvACqRF2DmORpbBwbKfMPXO
         iRSjLDKVTnd/fFXox9xDM3lYhT9g8+kvgDtMWjWgOHOk004xgyytaJ6CRnK+pG5H+TXj
         l1KJkVJZmeQ+T5K2EUyczBTm/uLNUYrSwVaSGLfLiXhEQc86YQoa6AZQTyxVRhTPERtd
         9TrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793419298; x=1794024098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qUjUqHrSOpVZo1vvK2oqewHli0ce+brsa+hIMhHohPQ=;
        b=OPlbBSzgn35Va9qRVrx4roCQTK9Me5wG3aEpquoBS59lCaEyQEglBL1HToFy4L+W1Z
         g2Fkh4ykAvRW25NCiUVHjtdlktq7+eUYxg2W0cXSlb8NitREL0O0pPcZzWcc+Mupd+5y
         mj1DLIUGX1oiucgoN5edxc6uhay5WqkN0Hs0urCqPKqICF+S8CjeW3FrPiVddqyf8Unz
         SsriwHSLxI7ibszuLaSRdxz16CM8Ub0eWXJqXHK7ek1lQ3+H/FCTRqVkMd5w5xOWqA7L
         I7EEMJg8bw8xDe6fWVpUwc+CXXtNMd8WLDpy/1k5TnrVZaaNzifdzV+4eznr1o20bJ5D
         ssVw==
X-Forwarded-Encrypted: i=1; AKwUvBwOPJ4Ouc9NuYIyFT1byF8SO7WJOYabi7qu1p43uAkt16Mk+QkCxvkk2aZ7JAQya8TQZH46cuboMAipXgQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZ8m1UrYvVsvoiRIq6/HJbnbfz9GCEk08r6puZ6Kfm/+kbn4VM
	kVgnQfCc3HK8TotdPfZAzpweCme09/3N6Kf6TAMqWEyC/bYfgxx9DAhv
X-Gm-Gg: AYBFou37sfQROl2eP2GT7q+Oq27zDfIslZbRFYcfCPeXzAjBtVLaWVwVWugX9jmKfMT
	a+chhI9KHXCa4WK2gnRvNE/STdd5RNhdHZnv0mXFEacoJohwRkxx6hRuQb6M2MISAhIG1AGHZgj
	cuDGdoMVx1OZ/h0RFPIAcoR0/b97iI0NbJHmbiBGiB4gAoZWNcv4YU1xvOMsU3/yd4gNyDmlSFd
	R8kJLNkIe9JGjcKKPJxodPtw9CjYtuXpczZOY/ntNwNCAaxzfznWc8yCigdJzYVuDsckspbdm2b
	d1ISlUHL+bNR1wjh4+ioV4XHEMFPwknQ6ReAS+x45xirCV0m3cZtrU3FkXbpUTddUlRqvl63vTI
	7r4G5wUE1a/HPRk5NwbbiaIPLJE1wA67kSmbZbuY0mQhFWN3bShq3SMp8QYzbnwVJdrxjV+UEez
	ZY3v94dLAZP+jSnzxXcfPFVHclmILpD8jJpzDVk8gB9Ce91ZdlHpDNGX0lon4UEGkR1HaKb8HYF
	rJjj/8thpZbj7PtmU8oX47AmZYG0AEfopmc3wIlWV3+YrxOhL/wWCDuLZU6H9Tu/5B09MI7K2F1
	CH3v++SHmT66Whzs2Kc6jefJsw==
X-Received: by 2002:a05:6122:1da0:b0:5ea:c51a:37a1 with SMTP id 71dfb90a1353d-5ec686ff12emr2004301e0c.8.1793419297861;
        Fri, 30 Oct 2026 21:01:37 -0700 (PDT)
Received: from jeta ([2a03:d000:4386:7a7b:937:de08:2c2e:37e9])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69bf34c0sm4620576e0c.8.2026.10.30.21.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 21:01:36 -0700 (PDT)
From: Egor Perevoshchikov <rickbatra0z@gmail.com>
To: amd-gfx@lists.freedesktop.org
Cc: Egor Perevoshchikov <rickbatra0z@gmail.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>,
	Ray Wu <ray.wu@amd.com>
Subject: [PATCH] drm/amd/display: Restore PSR-SU guard in power module
Date: Sat, 31 Oct 2026 07:00:50 +0300
Message-ID: <20261031040051.46100-1-rickbatra0z@gmail.com>
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

Commit a5ce8695d6d1 ("drm/amd/display: Avoid configuring PSR granularity
if PSR-SU not supported") restricted DSC slice-height configuration to
PSR-SU. The power-module integration removed that guarded caller. Its
replacement in mod_power_psr_notify_mode_change() calls
psr_su_set_dsc_slice_height() unconditionally and ignores its return value.

On PSR1 links with a DSC slice configuration, this applies a PSR-SU-only
alignment check even though selective update is not enabled. If the
calculated DSC slice height is not a multiple of the nonzero advertised
SU Y granularity, the helper triggers an assertion. It also sets
dsc_slice_height before failing the check, so the caller passes this
SU-specific value into PSR1 setup despite the failure.

Restore the PSR version guard and failure handling in the new caller.
PSR1 proceeds with the zero-initialized DSC slice height, while PSR-SU
retains its alignment validation and stops setup if that validation fails.

Fixes: 3c108046e1d6 ("drm/amd/display: Add power module on Linux")
Closes: https://gitlab.freedesktop.org/drm/amd/-/work_items/3027
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Egor Perevoshchikov <rickbatra0z@gmail.com>
---
Tested on a Xiaomi Redmi Book Pro 15 2023 (TM2209), Ryzen 7 7840HS /
Radeon 780M, BIOS RMAPH5B0P0909, with Linux 7.3.0 on NixOS.

The tested panel uses PSR1. Its 2000-line mode has 16 vertical DSC slices,
giving a slice height of 125, which is not a multiple of its advertised
SU Y granularity of 4.

Before the patch, boot produced:

  WARNING: .../display/modules/power/power_psr.c:666
    psr_su_set_dsc_slice_height+0x7e/0xa0 [amdgpu]
    mod_power_psr_notify_mode_change+0x1b7/0x270 [amdgpu]
    mod_power_notify_mode_change+0x160/0x1d0 [amdgpu]

After rebuilding and booting with the patch, that warning is absent.
With VRR disabled, repeated debugfs reads report psr_state=6 (PSR_STATE3)
both with and without the patch. PSR remains functional in both cases.

The older dsc2_disable warning in #3027 is no longer reproduced on this
kernel. This patch addresses the remaining psr_su_set_dsc_slice_height
warning; it does not modify the dsc2_disable path.

The patch is based on the mainline v7.3 release:
  c03c1a14507dfaf8b856c2608f9ac216021fc222
This matches the kernel release used for hardware testing. The original
power_psr.c is identical to the Linux 7.3 source used for the
hardware-tested patch.
The patch also applies to drm-next-2026-10-31:
  f94ed3d7cba3c83eef50b1a96d630d63cf54f69c

Additional validation covered eight cases in an isolated C harness using
the actual setup and slice-height functions with hardware calls stubbed.
The original PSR1 warning was reproduced; the patch avoids it, retains
valid PSR-SU setup, and prevents setup after failed SU alignment
validation.
The patched translation unit was also compiled against Linux 7.3 headers.
PSR-SU behavior has not been tested on PSR-SU-capable hardware.

LLM assistance: source history tracing; stubbed software tests; submission
checks.

 drivers/gpu/drm/amd/display/modules/power/power_psr.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/power/power_psr.c b/drivers/gpu/drm/amd/display/modules/power/power_psr.c
index 96bb77fff05..7139395b5c0 100644
--- a/drivers/gpu/drm/amd/display/modules/power/power_psr.c
+++ b/drivers/gpu/drm/amd/display/modules/power/power_psr.c
@@ -94,9 +94,12 @@ bool mod_power_psr_notify_mode_change(struct mod_power *mod_power,
 	 * The value of DSC slice height is determined in DSC Driver but it does not
 	 * propagated out here, so we need to calculate it as below 'slice_height'.
 	 */
-	psr_su_set_dsc_slice_height(dc, link,
-				(struct dc_stream_state *) stream,
-				&psr_config);
+	if (link->psr_settings.psr_version == DC_PSR_VERSION_SU_1) {
+		if (!psr_su_set_dsc_slice_height(dc, link,
+						 (struct dc_stream_state *)stream,
+						 &psr_config))
+			return false;
+	}

 	dc_link_setup_psr(link, stream, &psr_config, &psr_context);


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
--
2.56.0

