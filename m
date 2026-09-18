Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C2D40DB40
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 19:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789760062; cv=pass; b=QJYJfwTkmL+a0Mt+wS2ZWwH6mriShL53ip2VgzlE4nWXuRW999OUks+c8NnicmSb6aDAjJtKqtTSf5quFa3+hD/UHiUf3q7r5mzNhlpWL6BSNHX2YI0g55xT7t9Sshqa7pBPKyuakwIT2FvbqSmCME+FXK21o33pUfDtj7Vwky4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789760062; c=relaxed/simple;
	bh=UQgain9xD/FybNBG7EdHUaTe5mXW4SmgmoWH0dHKlGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hc6yMUIIdY4wiw6PwHwxxDMdyAi8wXVc+TOWYK+oFOOCmGZ455m/jNAFhf632Yx2kA+9XuLZtZH8jzxAUI8FTbSmKnCEo+vYJleaBMzYL5Yb/Ik92cXJ+y9gS3OUOCXRsOVGAAI6TS1UrRcVnn1z/Bvh6wf/aLlFEvH1rIseJ1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpKU3npB; arc=pass smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpKU3npB"
Received: by mail-oi2-f12.google.com with SMTP id 46e09a7af769-7f4f0d298caso522911a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:34:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789760057; cv=none;
        d=google.com; s=arc-20260327;
        b=CY/BRv2uHlXG4c+qIKaWnHSoVvH+rE/Py/llBq7F8Vn3y/rN+ROnzvxFstpknx/J05
         xpbc1nmJko1oGLQruFZuLc0VdiRoFxRULrbIzfQAovCCzfhGSmxSbWUf+pTZvQMt3jF1
         xsiBkQu2ivwUoo1cDx1CGv9ll8wKX0R3CL3C9Z30SspmnVTZu/uvg01Bkvq/mCKyywhF
         BK5HN0ni4tgUdN+WLCXaqAwpdEzVaJan8ypvQx1QTbBmjgeCVbCDw1YC/3T1hpO/Py1J
         xKBAV0/TVsvWVJDylLDQ7VpLh4+hZ0CB2ssQM36muO8ybLzk6s/JSfkojP4dyn0Al3EF
         MnPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HEBRqIsSTQzd9rKLEVseklIX+CL9gWoia7ir8tJPSpA=;
        fh=zb0HUwz+C8e7x2J/LQtmIVBS8V/3c4RlJHCQQL8YpUQ=;
        b=Y5QRVK81d2izyJzkz5mpc1NTx855eHkcNgqbH4iHFeTaQliK/sXTL38PcnZkRnlAV+
         efhD2SScvo0NGmNaAaWBRmU5zXPdbvL8ovMLGTf7JE23YjvFZFffLaVayEO1Vjj7Rn4z
         DH0d7hKIAG0k+dpo/wRvTPTnHtOxB0EvZhMwtF1oTyWUJT32O2AspTZLiX3oiEA6aicK
         KkhIyAr0yhlbt+GeA2eV9NhAxYHSZ1Fumz8o8OsY5u0jGR3mRUJD87+L1Kpm2F1YSgDl
         sCRyl6YumRZdCNHL9+zH2+uvhy3t+ukR3bZFc9HmEupVwDx1S2Z42h1ECsM0W++YD8or
         2V4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789760057; x=1790364857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HEBRqIsSTQzd9rKLEVseklIX+CL9gWoia7ir8tJPSpA=;
        b=EpKU3npBJ/2Cf7cJfIFVkRoJSazKfXZ6n1FYoqWnAnOZiYrhax7MTQ8bnn/kyHCTHP
         QGn6iBej5weHZt6O6xFzPaeHi4YwOQG9gfVGTnS0XNc4fPHe+b+6oru0vevb/8foYCfp
         gvyYnyCaxxGg0dVqVcLwv09yFIvi3lDWl4vtG2Q9AW/aYB24HmarJcJrcRD/6I3uDaSh
         toG+WQZYqGkD8dQuRt0l85TzBoj/mIRXDwRA5+O0EiVZjkfyoRJRlkrNxVlveXJuTnQX
         QDW17fVFm6DueyjPDCjMJlbx/JAwMIbeO5vA3j21j8vMZyGkOS2Q4jitU6dzX3bupUuC
         mjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789760057; x=1790364857;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HEBRqIsSTQzd9rKLEVseklIX+CL9gWoia7ir8tJPSpA=;
        b=hAFrgCaH4spfUcy7xXaEA2+yvPoIn7aIRNvk/DiX4WE6cQI32z0tj4Q9ztgNlK3St4
         rAhz5rYsgMEQOBqUDXER0yekffg9NXeRTOl5b98YnSCelof5H++3Ntdf2IOTQNWgtI3s
         phJdY6j9cHVdVT5Y7oI/OQITWQRYCxsa83dOKxUoeDoWMS79pRHXVAikrAUprlP1YZBj
         4BTGVXiGBXzFTc791XpaomconHNKcOuqFPB2brzFpS4iLHwyMdTzjXvfYTPcrDrXsWR9
         WSzFFH7NBLjVmsXkpuk7dVS0RMGajhs3a8nlaPB12ZYEuXF02425M90MaqHbdoCPpuAL
         e/qg==
X-Forwarded-Encrypted: i=1; AKwUvBw/AnvaBVKNd9xV3heWIGc9qsBqFv+Cy8Q5VNunSeU61NetBbVKYA/RTUaFeq1He/GFU6zZNvPbeU5PTjA=@vger.kernel.org
X-Gm-Message-State: AFuF++nblf0Hm6qvDZMmHglTf2E91L+/m0b6q14thFeSzLIaVOdUKrrw
	YkgtfauV+OhtxBQzSThuI9uhNuLfwItdbfjV5qWCsjV+ZOcUWXETuL0SVjaANP8HW/39867y92N
	E8CrNqYuf4aMCxoJ9ltCi09ai1tS7oA4=
X-Gm-Gg: AYBFou3XTh9DPYq2LlmyJTL0m55v2+kFKcXWAZmrU6iUpHGWSVnCRA77R3c2OFxUhSx
	iNWh/ohtMOfn9OEYj+AMcD1Tr/W1as5Hc2mpdDvm7qDla0nSoQZtpvEGPKaN2zcC6RFl1obgDIg
	K+nluYYHtSbpJ5tWu3yS1WGBmIMM8z6oQ/hiG2Wso8Q9ryE5wfO6uPz1boiWKxL/2DxoGnAfB40
	G3gaNpg7jBCco8vvVBV5VSSJ7SZn2kw9P5TCcWKMc4jsFxMjabgOrqlmCO6dyjwRm+gYdwtK3vY
	ZJ156RC6OJhzE+RC/RjIhEycylVeOm73PxZPcbB6HP1MvPtC6w7mJQ==
X-Received: by 2002:a05:6830:442b:b0:80a:3b3b:8ac6 with SMTP id
 46e09a7af769-80de21ccc78mr3969164a34.14.1789760056866; Fri, 18 Sep 2026
 12:34:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916232310.490786-1-avagin@google.com>
In-Reply-To: <20260916232310.490786-1-avagin@google.com>
From: Andrei Vagin <avagin@gmail.com>
Date: Fri, 18 Sep 2026 12:34:05 -0700
X-Gm-Features: AcwNN1XBjtAY4JmZL80hB75m38P2dFxrS_EkCVTxa576ED4_RWNFA_zjY0lNJ3U
Message-ID: <CANaxB-xJYd+RQ+-a7TOE4=_FkTL_PjRSHcvLRWnNubY-XTMSjw@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] x86/fpu: Restore and reinforce signal frame portability
To: Andrei Vagin <avagin@google.com>, Borislav Petkov <bp@alien8.de>, 
	"Chang S. Bae" <chang.seok.bae@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, 
	criu@lists.linux.dev, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 4:27=E2=80=AFPM Andrei Vagin <avagin@google.com> wr=
ote:
>
> The x86 signal frame is designed to be self-describing. The xstate_size
> field in the software-reserved bytes indicates the actual size of the
> xstate context and is used by the kernel to locate the FP_XSTATE_MAGIC2
> marker during signal return.
>
> This design is required to provide portability of signal frames across
> different machines. For example, a process checkpointed on a system with
> fewer xstate features and restored on a system with more features will
> have a signal frame on its stack that is smaller than the destination
> host's default. By relying on the frame's internal xstate_size, the
> kernel can correctly validate and restore such frames.
>
> This series restores and improves signal frame portability. The goal is
> to allow process migration across CPUs with heterogeneous FPU
> capabilities, as long as the process only uses features supported by
> both systems. This version addresses the original issues by pre-faulting
> only the required size of the xstate buffer (rather than the default
> task size), and includes cleanups requested by Ingo Molnar.
>
> v6:
>   - Clarify struct _fpstate_32 layout and reformat documentation per
>     Borislav comments.
>   - Add Reviewed-by tags from Chang S. Bae.

Sashiko reported no issues, all patches are green:
https://sashiko.dev/#/patchset/20260916232310.490786-1-avagin%40google.com

I think this series is ready to merge. Thanks to everyone involved.

Thanks,
Andrei
