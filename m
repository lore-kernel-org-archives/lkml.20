Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384384;
	b=HmKSGKcTB51vY/KbK42oNtn7eZJLBe/SEhLaP/Rf+qjSFbOlpAmIiabqSfPOA0Yp7nNW
	 wOpxAJ/wYOJgo80FEM2Lbhocl+y5JalDGFjB6KYaY8mz/AI+0h3GO7h4LKtZfx5CDK7X6
	 kqHPE5iMlznsuo7euxGMHchXhgAaOghY6E2QvWD/q/lmZuVxf4QyYXyx3iadrjS08GnlT
	 jLVJGWKjL0nlhreusvmY7FtjbuIWhGVmINiHDHEGhM1mb+0LlXy+kvPjE7QVXgi5WGUC8
	 Oh+bbMP4zmhbw0l/A46QKeMpmge401J+IGN6ubYAWprxgn5YMg7gI3HFckVHMxahiTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3LLEGJE7y5aPT+HnIU6J6m7BGoZ7itZoJV528pdc6LI=;
	b=WigiJFIvxtmKLIAVXGMVDLfc/VWM4JwX7SS7iyF20euCCaost9p70u8krAg6ZgASFAu+
	 Jyp2FqV4gKT/M/+j8Ife/TTNLhM/7RwvxAhVvcpDZI7nX0P18LlvmJMo9Uscib6E9UzN2
	 +GKOt/ZQEhcWSKsXzHiUkc3qgcTKVUFCdHGEyozv3/zUGuiKvN6GGJ8fe6CgOu50NU9Eb
	 KbJPj/vgqMNlAK57wmnD3SS6KIBLA/q9OdMyFCHhmkIJs2Dt3S4OqYx56ntWJFJho3hxq
	 OlTezLvbcjSShOisN/UEPQsnmkCXzSEjEA08nxE/aXz4oj4vBew+y86qwprYeS+i/pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="XOr/XTuf";
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FA7606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2FA7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=XOr/XTuf
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b633ddfad6so3837386a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384382; x=1794989182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3LLEGJE7y5aPT+HnIU6J6m7BGoZ7itZoJV528pdc6LI=;
        b=XOr/XTuf2hjhRt8gr0qA5ciW4P0vBeNtytOcrtNb5UFFdgaB/aPz/qPwoZPDgHmsbJ
         SbjWob8qSY4CZzSfyu3yKR33lNugUfqFVpJXb1jh5tuiHU8looKN2p85UFa4KLMl8Ihm
         YK/t1+bs9AJH0xg/0WtXIzWVE0vtrNCp0VlMtcsvzTJHDvgHAMa33lmloXgYMSnFxJ3u
         coqJfccvnYI6SGVWlbKM92w3O7aERbZgYYsX3lepw59CftBlb+nBZea2DBJwTuLkiY5F
         XSw5IM6AiPJex/ruOBZeOCgJUwSZ/gafsOjTfC1+t/jDJShhzzr8m2DUf1mJjjG+dzVD
         vynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384382; x=1794989182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LLEGJE7y5aPT+HnIU6J6m7BGoZ7itZoJV528pdc6LI=;
        b=sLXwxgDgTkoGIk5r5FOZJ+6HzXHrLSwOTEUUXMm84OzwOTQfpK7trR2xzKuMThzM+5
         5CizgT8JHtlmBexvgygW5BZlb+YbpRooUkabw2qpni3Ib9zd14p5wNgT2/+Qn0CZWfWX
         SUQHulWJ4GqklyYJjUhDmXUvveDAEoJoev2/9Khas7czuOQcQc2MT65aLCbzlveSvEj/
         sAr5WpJj3kpwQiBBjD/Rsp/cW+/uYv0wDIQtc8dYOBLOLvnrpTtY7JbP8R+xfnIF6Q8O
         E/Ly+w7TBjt7F5GpckJqpxDZxrfEaUN5DXVYPBbSvM4868S0y9TGRl2TFdWtmpBLJVpF
         qMTQ==
X-Forwarded-Encrypted: i=1; AL+hErHYL4Mgr5HFZ+gxGzbj4iVKzZqYHXtxlT3GvmVIY0yysuxndz8PqEXfdSEMaSDRwscHNN5p4ss5gU6kjds=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mztS+n8Xid4Md6gw0bgwrkto+1/V94Sgxm6koXG9IxwpLnGlW
	EpNWnrXxNjanJzs05jTN3aNePpuxaZy132v77bSUcWToQL+rK0i51thFH3xApMQ40A==
X-Gm-Gg: AYBFou3ROFHY6r7RvxGI56iWxuqrb7iZcThLqZTrGOZvDCRYfUn5EPecOWXRo5HMdOv
	4jone5qF8VfKMi+S2D823UG3cT+lv1/WeW5xQ4s3R+Nw0jdHe23REJgGP+WJmfhSaQqVHBkyEle
	mlz6TxzqKxpMzDzWj7gADOZS1+3gs+bImcwMKwG6UF1A+CjwRsLBP5QO1kWyLUmXCFiZArUVwEF
	JEtQxgwP2JSw39+LKcPPNYMW9kjcL7bsgV2XF0D1ynrE43jLRt0LnoGt29eZ2B3IHq7Wpx6fPGV
	OxHkm20QcpBmaT/fkzo1cXQNzzMM/nd93kX/MwlpsLDBvnkHcwo+LkR7dit3h5aQr719XS3MbaN
	NmLrwCfKugkPYCmG19dLRlraJ7pZdag62ZR9eHANthQjT7+d/XuhAXpEaJTTdsRtgZh5pbd1IL6
	WryzgfMZ/Eyrc/AFpfBaO9qmbecJ0Pe7jVxPTtBlR7pShPGlpBAR9onHIQMds/0WkgIOGhtKsUB
	Q3L1//BthUlz4M139gGju5PbonrqSaoVApJnlryrdjD+ySoAWjr8wBa1TfLWgKUSCE0lV7XMqS0
	aA/bOD2wds53a193bPfNdBfi69/a9vInpcaJ4FSCwqKEy1uAAbPn58JjKtGQ7zQ5F+MIRYNxdIj
	VLxanRFBVc2RqGTJIveedQBbDuraOX3djRcV9TDdU2c7FchcRmFbIQfsD0Zn42PhEScRwbNxjxr
	d7HULTcaBwGmgIPbX8LI+u/l2op9JdiOF179wMTG6/TLJt+31WzUWRqt5T4BFL3qOLkQKEvb5nf
	Ab+EiAGg0UsbZtwGhtmiGGt8I5RWOg75F0N+OlBS/xDTUKxc/X8BM6CE53ccFy3AKeD4eF0g1bs
	UPAQhRHOGy3t0i3ZzOk=
X-Received: by 2002:a05:6402:a646:b0:6b1:8818:1090 with SMTP id 4fb4d7f45d1cf-6b7773f30d0mr845593a12.22.1794384381940;
        Wed, 11 Nov 2026 00:06:21 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75790875dsm2075683a12.34.2026.11.11.00.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:21 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Anna Maniscalco <anna.maniscalco2000@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: Keep objects of queued VM_BIND unmaps busy
Date: Wed, 11 Nov 2026 09:06:19 +0100
Message-ID: <20261111080619.244138-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

A VM_BIND UNMAP closes the VMA when the ioctl runs, but the pgtable
entries stay until the bind job runs vm_unmap_op(), and the job can wait
on a caller-supplied in-fence for as long as the caller likes. In that
window the unmapped object holds neither a pin nor the job fence:
vm_bind_job_pin_objects() and vm_bind_job_attach_fences() only cover the
objects named in the userspace ops, and an UNMAP op names none. The
shrinker then sees an idle object and purges or evicts it, and
put_iova_spaces() no longer finds the closed VMA, so the GPU keeps a
mapping of pages that are freed and reused. The unmap half of a remap
and a MAP that replaces a mapping take the same path.

Reserve a fence slot on the object when an UNMAP op is queued, and add
the job fence to it along with the fences of the mapped objects, so the
shrinker treats the object as busy until the job has run.

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
I used Claude (Anthropic) to help write this patch.

 drivers/gpu/drm/msm/msm_gem_vma.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 8b702422030af..d12df7e42fce8 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -473,7 +473,17 @@ struct op_arg {
 static int
 vm_op_enqueue(struct op_arg *arg, struct msm_vm_op _op)
 {
-	struct msm_vm_op *op = kmalloc_obj(*op);
+	struct msm_vm_op *op;
+
+	/* Slot for the job fence, see vm_bind_job_attach_fences(): */
+	if (_op.op == MSM_VM_OP_UNMAP && _op.obj) {
+		int ret = dma_resv_reserve_fences(_op.obj->resv, 1);
+
+		if (ret)
+			return ret;
+	}
+
+	op = kmalloc_obj(*op);
 	if (!op)
 		return -ENOMEM;
 
@@ -1419,6 +1429,8 @@ vm_bind_job_prepare(struct msm_vm_bind_job *job)
 static void
 vm_bind_job_attach_fences(struct msm_vm_bind_job *job)
 {
+	struct msm_vm_op *op;
+
 	for (unsigned i = 0; i < job->nr_ops; i++) {
 		struct drm_gem_object *obj = job->ops[i].obj;
 
@@ -1428,6 +1440,17 @@ vm_bind_job_attach_fences(struct msm_vm_bind_job *job)
 		dma_resv_add_fence(obj->resv, job->fence,
 				   DMA_RESV_USAGE_KERNEL);
 	}
+
+	/*
+	 * The VMAs of unmapped objects are already closed, so the shrinker
+	 * no longer sees the mapping.  Keep the objects busy until the job
+	 * has removed it from the pgtables.
+	 */
+	list_for_each_entry(op, &job->vm_ops, node) {
+		if (op->op == MSM_VM_OP_UNMAP && op->obj)
+			dma_resv_add_fence(op->obj->resv, job->fence,
+					   DMA_RESV_USAGE_KERNEL);
+	}
 }
 
 int

base-commit: 1e59855738454b14021b64115f0090eafc7526ae
-- 
2.53.0

