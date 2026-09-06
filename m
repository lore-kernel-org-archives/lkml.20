Received: from a11-146.smtp-out.amazonses.com (a11-146.smtp-out.amazonses.com [54.240.11.146])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D931EB1AA
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 03:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.11.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788664484; cv=none; b=mLTtgTNpu3vRHLdh7r/WlnmSI9EGxCBvq0aeaTio/wTn7CcdQ70uiIVCUn3/VAfk5uM+wLonjryaAF6xdTQM2gFb5PbYoSBWBabjkS6n7LRvfN13xcHaPFJh9N9N5USuc4OCqc0j/nS3+hW+7UbgYB0VjVBMB9WukYU+MNUxslM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788664484; c=relaxed/simple;
	bh=pXOlrsxVn9sFrfQ+wohuB18GfxAbg92rHB0bgKqpf80=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type; b=OcuLkZkJfdesxe1m+qgWvZqJVj2T800NAPVOpVqnRKPhHw7unrWO+5F1DDFyqlXK6SnYxQo+RMB63JpcLZj2tbdbDrC33u0Arzc8Njza1jXJS5cP0Eu5ONX62rhK3o1i2KhLavq36i05AQoQTbvq8r444gOsViEj7OAqJPp3ITQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=willyv3.com; spf=pass smtp.mailfrom=send.willyv3.com; dkim=pass (1024-bit key) header.d=willyv3.com header.i=@willyv3.com header.b=M/eILOId; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=DFPfYh5n; arc=none smtp.client-ip=54.240.11.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=willyv3.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.willyv3.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=willyv3.com header.i=@willyv3.com header.b="M/eILOId";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="DFPfYh5n"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=willyv3.com; t=1788664482;
	h=From:To:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=pXOlrsxVn9sFrfQ+wohuB18GfxAbg92rHB0bgKqpf80=;
	b=M/eILOIdN6fpCKX4TPGjgBrGC6Xuurv2oE3NHH32Q53SxyPfXsPNeHlq3eZuPlpA
	LoMz2ZO8cJdPx3E4YXL4Q+u2SgW7FWv6bUJEwnUelH8+vWQVh1BtqtuWDh8G2Fn4RjL
	ngZmoY/BMuYEAza5XAkluJpIF+ImWerxaEd3S4jU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1788664482;
	h=From:To:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=pXOlrsxVn9sFrfQ+wohuB18GfxAbg92rHB0bgKqpf80=;
	b=DFPfYh5n1P7LYadPq+97Ev76Q1+jle3UwH+HcJa+KhGRl5q/PNfLD4i1R3ltRGz5
	Kh+eZslDgML/+v7ygByib3ZeqI+x4fd26Vr9s2FCt59ZRGNNHi170ioJFH5ZOZBmsk+
	14uAl58WcmfP7lhzyT92H4QspH30Q16M2+PnYSz4=
From: willy@willyv3.com
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
	simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: only treat a real S3 as a suspend abort on
 resume
Message-ID: <010001a074b60857-4cb0239e-c529-4069-ba4e-e347cfe379a4-000000@email.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Sun, 6 Sep 2026 03:14:41 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.us-east-1.tVoVnBTusQKwEv3FXsafng3gwgTXiveIP8uCFN696SRuTdSqJLPWcLHhZMGYqGEWfSP3N+is2iSOKdmX/9ngsLeiTVoJkakNxJEB+yEN1ZJPtwlO53LLRiFsTHXrFviVUeKFV0/4bko6iGjXsDtchIeimK+HIEYE/SJqJKFonco=:1.us-east-1.pAEstvQcjyhQNKGKcgSlzI7SVR8ZSG5wSmKwiz/A8Dg=:AmazonSES
X-SES-Outgoing: 2026.09.06-54.240.11.146

From: Willy VanSickle <vansicklewilly@gmail.com>
Subject: [PATCH] =
drm/amdgpu: only treat a real S3 as a suspend abort on resume

soc15_need_reset_on_resume() resets the ASIC when
`adev->in_s3 && !=
pm_resume_via_firmware()`, to recover from an aborted
S3 suspend. Since commit 38e8ca3e4b6d ("amdgpu/soc15: enable asic
reset for dGPU in case of suspend abort") this applies to dGPUs as
well.

Two things make that check fire on every suspend-to-idle resume of a
dGPU, not just on aborts:

 - amdgpu_acpi_is_s3_active() returns true for =
any non-APU regardless
   of the sleep state actually used, so in_s3 is set=
 on s2idle too.
 - pm_resume_via_firmware() is only true when platform =
firmware
   resumed the system (ACPI S3). s2idle never sets it.

So on an s2idle platform every dGPU resume is misread as an S3 abort
and gets a mode1 reset it did not need. On most parts the spurious
reset is survivable. On a MacBookPro15,3 (Radeon Pro Vega 20, PSP
v11) the PSP goes into suspend with a failed TA unload and the mode1
issued on that state leaves the bootloader unresponsive:

  amdgpu 0000:03:00.0: S3 suspend abort case, let's reset ASIC.
  amdgpu 0000:03:00.0: [drm] psp mode1 reset succeed
  amdgpu 0000:03:00.0: PSP is resuming...
  amdgpu 0000:03:00.0: psp reg =
(0x16063) wait timed out, mask: 80000000,
    read: 0 exp: 80000000
  amdgpu 0000:03:00.0: PSP load sys drv failed!
  amdgpu 0000:03:00.0: =
resume of IP block <psp> failed -62

The check was introduced by commit =
58a8c756fc4c ("drm/amdgpu: correct the
S3 abort check condition") for APUs,=
 on the basis that the PM core sets
PM_SUSPEND_FLAG_FW_RESUME when a real =
S3 completes, so its absence on
resume means the S3 was aborted. That holds=
 for S3. It does not hold
for s2idle, where firmware is never involved, and=
 commit 38e8ca3e4b6d
("amdgpu/soc15: enable asic reset for dGPU in case of =
suspend abort")
dropped the APU gate without adding a check on the sleep =
state.

The driver already caches the sleep state it suspended with in
adev->last_suspend_state. Use it: only a suspend whose target was
PM_SUSPEND_MEM and which firmware did not resume can be an S3 abort.

With this the Vega 20 resumes cleanly from s2idle (PSP up, all rings
back) on 7.2.2 + t2linux patches; without it every resume fails as
above.

Fixes: 38e8ca3e4b6d ("amdgpu/soc15: enable asic reset for dGPU in case of =
suspend abort")
Signed-off-by: Willy VanSickle <vansicklewilly@gmail.com>
---
Tested on a MacBookPro15,3 (Radeon Pro Vega 20, PSP v11) running 7.2.2
with the t2linux patch set, s2idle only. Verified twice: without the gate
every resume fails with psp -62; with it the PSP and all rings come back.

 drivers/gpu/drm/amd/amdgpu/soc15.c | 7 ++++++-
 1 file changed, 6 =
insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/soc15=
.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
--- a/drivers/gpu/drm/amd/amdgpu/so=
c15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -591,7 +591,12 @@
 	 * 1) S3 suspend aborted in the normal S3 suspend
 	 * 2) S3 suspend aborted in performing pm core test.
 	 */
-	if (adev->in_s3 && !pm_resume_via_firmware())
+	/* Only a real S3 (mem) =
that firmware did not resume is an abort.
+	 * s2idle never resumes via =
firmware, so without this gate every
+	 * s2idle resume of a dGPU is =
misread as an abort and mode1-reset.
+	 */
+	if (adev->in_s3 && !=
pm_resume_via_firmware() &&
+	    adev->last_suspend_state =3D=3D =
PM_SUSPEND_MEM)
 		return true;
 	else
 		return false;
