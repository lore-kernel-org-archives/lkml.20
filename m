Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262BF3BB67F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286565; cv=pass; b=ez64CUNFq4r4izElfYGHCKwKdZapfjiV2//ePns+17L5BhtEygvkahRgFIFitXHMVqgj/UY4Jn8m8fXwPfoJ8xJ/002/RStQnSfwR9AUPhiE7LFzw0AKhTcICcowj4OD9/yZqbbbdfE8vHuYEepsAC4cRCPw4X57Yj/mHYTvAvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286565; c=relaxed/simple;
	bh=IOZdo6RY6JZCS/RhKzdbZOS/gJ453N8ilVos30rrtrk=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qNw8BzcYcptPUbVHhGPs38ZUxCX0+2QJjmr4Qr3HSgNOKqZf+K2WsAeR1Tg/9HmimlSyfzOzfx4MGuybzMuRYDrtgf9Wvbco5p5K2drEyz682YO1UJa8F6sw8oG4crplOE07BXgSlqeVLUSGzZGLm/sY3KjDFb4emnvFdIDKZOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/5S7HnL; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/5S7HnL"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c169ae1cb26so183133966b.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:49:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790286562; cv=none;
        d=google.com; s=arc-20260327;
        b=JvCYnm8ok7c9G/3vPqB4FVC5EFEA0cZVEr+G8LGDnQiqM3Ta4jBbFDcwl6x5JRtiR+
         lh3UlmdTeykCrl3BiDfePmVbqTShtZ52x5SxFkZjZxAinWoWEiORvUNKgZng7Zte9434
         qjzDIdAWXaeH0WhVcYAvIEFyuXb7NTaEXAsNTcmfKV15nCVquqChxW+yGezJq54Dyww1
         Sgr05S5SzkabmfODOmLTgIbdS+0SwW3DZkCstZ2i8BohTsaWMMb9qIN66JWVoNALg/Dn
         M+ufGo785swqINi4q089fi1cCA9zts6TA53zCyp8UhpkhaKQtBkUcN6HuN1vb/EuspDt
         7+NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=UiSS5MDz/yhz0gJroXWIYjWE1XbsEfZtw32iYL5QFY8=;
        fh=HUNvWwMDwE8lgpQvMQI9HkuHtyJyb/xfuikpdex5Z2c=;
        b=Ze2aKM/r+LhsJHJIa9HxzXsTMJKHi6tzuMZrrz8xMsVcgatBY04dYXhzPEaEm7erMY
         KKzSnb9+cSLvgOCgvkcy5dWskO5VelYkWMAWy6Q4RPqjn/9dEcJqogej6rtlOx02PSK8
         Cv0lD8aX05TfvC20IwtqR/UWyMX/FkU1OwemWqdTAqaGohT7weZrPpz/kpfV4GCUc+pH
         4/RYUAkl5Kxs5mI0A5CtQ95p0vqjbFwwcaQyl2mWKVJJA10Qe9QWUlp30mQis9JuikD2
         5Ce6pvkIL48y7UBYrfqDtAMeUVh8gTn3ANF5LxAeNtPvK/I2TnTmZbJd0XI30c2JU9WF
         whqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286562; x=1790891362; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UiSS5MDz/yhz0gJroXWIYjWE1XbsEfZtw32iYL5QFY8=;
        b=J/5S7HnL4FWyRco7pkbziAehu6lP7fVmX6achpExkVa03QQ+skKvsjMBrp0V7pHeP6
         utJBdqGy2ckmgNdBOJAhXpK0TXYaPCdW1dUOvy70sQ3DLI6IP5JGaoTqvB0XsrvZG8MM
         L0Oaq1jWIHc9W3ClhKXPxoBGlW5HiL4aeUDBCOSwty8N1ZfdRvbgIIWY/znYNCUefNsq
         On4OFLC2Gurt9jvF7uikY7d3G7K5sAHxNlTNiz+fNE7nE05UfEzCBdRvUzXp4zrNw3U0
         uz//hFNZ7oqdV7ffJ/WOdt1U+Det2Rek60p03pI47jS2kKNX2A8pxndzABGO+PKcGtKO
         9K4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286562; x=1790891362;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UiSS5MDz/yhz0gJroXWIYjWE1XbsEfZtw32iYL5QFY8=;
        b=PhqUyJGBrRybuz1HD6d7983OhtQuE5R+l5cuTRxFyrS1rpqKn2xNxkraz5vEHfTHWF
         WUDdl4uwpud2nvs0JLHWx4VKNatezMB/Ua2vsuKi2XKjKH+KoXyeNilKb0DXCd4TdUXf
         g6DyzjH3yhC6O4/LyqCyWG2zFAc37AXIpL5K0UhYtg7s3IKq42NLM47oFq1LjEXb9mJz
         kajs+83S9PRNiw3CtKFlWrV+xwERP8KYFzrsz5o+GgUmfXvPl6JMhbjh9umRv2auTeQi
         h0OmW8j6fsD935WDkka4GZD857m98Blfn1xMLugLjY4x36by4UgOIV9Q3cWlvJ3NWDP7
         gK8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzFnQUI2a6bezwxrN5R8VfLpo44K7z75xeSeLcqTDtDxNvFd4s5NpoUv9tvMIkFQ+jkwMY+1Mt4xdIQWIA=@vger.kernel.org
X-Gm-Message-State: AFuF++nwKPwhc1//8M3410nJA6pIKTPQxwy18q5P3oLaVNgIzsPINUn3
	Eg7H9zw42xnwMGbUPFHrtBMcLJI7vHF8p0J16t/hVWVc3zWUwTvjSlnNObJHNMQo+fHSEP+jgeA
	181PuRYPA8rtboAU46kV6hgRr9CmM5g==
X-Gm-Gg: AYBFou3NXq1sPsh4yPvZM5YG1Mxf7YgoQLTR5nTNXKxbsshzAmujvXEcXowqkBNSSEy
	3dtUKgFjjwmEaLoz91f6ZD7CowE1/fEyMPmlx/hwc37MdyR1BMd6MMFex0Yrhoahce4uguqFXwr
	qnyRUztL8J50pg4xbv2w//NsZLvf72jO75VtU7u9RHqilotck7YT9sSTEdiRaTgYKGl6QhWz3RX
	557qU2L19zqLlqYKKH6XCYRONEPgSE1EHaw3bLhmMRvAR8pt6NH7EMdu2vI6Gi/gdN1Pzz8jC7u
	q3hXjodIT700UqEAFWecM4s0EmYIvytg0Ni2WAnwT9hdd5oKHN2dOvlIum852v5CUVabAeyWyp3
	GZSpITrC6znAPZ6CktMVDUhraXsn/9GCM1VaA6uzF8GRowC0DWP0bTpIRvds1WxDh
X-Received: by 2002:a17:907:86a3:b0:c25:5a26:3787 with SMTP id
 a640c23a62f3a-c2ac2240137mr324783166b.8.1790286562321; Thu, 24 Sep 2026
 14:49:22 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 16:49:21 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 16:49:21 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAGEsz8HmUoQq7XLr5ZN7diWt-sWYoUwYd400vpq5jYEDEB7_vQ@mail.gmail.com>
References: <CAGEsz8HmUoQq7XLr5ZN7diWt-sWYoUwYd400vpq5jYEDEB7_vQ@mail.gmail.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 24 Sep 2026 16:49:21 -0500
X-Gm-Features: AclHuK-DvetQh1gHZkZvAtF-Wo01E6S6SV8NInGxHeSu-8odoao-bwAIz_ybmN8
Message-ID: <CAGEsz8HrSazyf=aoRkAD49S15fKwYdswFBXbHq=+MCVN4PTg1Q@mail.gmail.com>
Subject: [PATCH v2 1/2] media: amphion: drain message work before releasing
 core state
To: Ming Qian <ming.qian@nxp.com>, Ming Qian <ming.qian@oss.nxp.com>, 
	Zhou Peng <eagle.zhou@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

vpu_core_unregister() frees core->msg_buffer before cancelling the message
workers, although core->msg_fifo still uses the buffer as its backing
storage. A queued worker can read it after it has been freed.

Drain the core and instance message work first, then release core->vpu
and the FIFO buffer. This follows the ordering in vpu_core_suspend().

Fixes: 9f599f351e86 ("media: amphion: add vpu core driver")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/amphion/vpu_core.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_core.c
b/drivers/media/platform/amphion/vpu_core.c
index 85cc4a14f8ed..a0c58ec97a42 100644
--- a/drivers/media/platform/amphion/vpu_core.c
+++ b/drivers/media/platform/amphion/vpu_core.c
@@ -299,22 +299,23 @@ static void vpu_core_put_vpu(struct vpu_core *core)
 	core->vpu->put_vpu(core->vpu);
 }

+static void vpu_core_cancel_work(struct vpu_core *core);
+
 static int vpu_core_unregister(struct device *dev, struct vpu_core *core)
 {
 	list_del_init(&core->list);

-	vpu_core_put_vpu(core);
-	core->vpu = NULL;
-	kfree(core->msg_buffer);
-	core->msg_buffer = NULL;
-
 	if (core->workqueue) {
-		cancel_work_sync(&core->msg_work);
-		cancel_delayed_work_sync(&core->msg_delayed_work);
+		vpu_core_cancel_work(core);
 		destroy_workqueue(core->workqueue);
 		core->workqueue = NULL;
 	}

+	vpu_core_put_vpu(core);
+	core->vpu = NULL;
+	kfree(core->msg_buffer);
+	core->msg_buffer = NULL;
+
 	return 0;
 }

-- 
2.53.0



On Thu, 24 Sep 2026 14:49:08 -0700, Myeonghun Pak <mhun512@gmail.com> wrote:
> vpu_core_unregister() releases the message FIFO buffer and VPU reference
> before draining queued message work. An open video instance can also keep
> a pointer to devm-allocated core state while sysfs unbind removes the core
> or its parent.
>
> The first patch drains message work before releasing core state. The
> second prevents manual unbind on both platform drivers and warns if core
> removal encounters a live instance.
>
> Changes in v2:
> - Move vpu_core_put_vpu() after the work drain.
> - Keep runtime PM and mailbox teardown unchanged.
> - Address sysfs unbind in a separate patch.
>
> Myeonghun Pak (2):
>   media: amphion: drain message work before releasing core state
>   media: amphion: prevent unbind while video instances are open
>
>  drivers/media/platform/amphion/vpu_core.c | 18 +++++++++++-------
>  drivers/media/platform/amphion/vpu_drv.c  |  1 +
>  2 files changed, 12 insertions(+), 7 deletions(-)
>
> --
> 2.53.0
