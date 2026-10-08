Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF493B14D0
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 17:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791480228; cv=pass; b=dXGDr9/tg3ojaNCYxIoM0hY5Xvmmz/hzEtTQoCPZFs5yiU8au0JkG4HDyOj9YhEQ7KeGrZUjAsoWfBoCpzkB+8FYFPsNY5JdIlV3z8YfRzWo7eHizUEo+bGkmgxP2/0IP/oEYg9xOtJs4gMaPvEY+gC1CEI/Xq+YFm3xxzhvphA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791480228; c=relaxed/simple;
	bh=BHuqIf1tNL5IFXF1A87VrpQrMhtfq/QBoGyo3k89R/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZnFAbwdPpRWjoZx552EUPr3GWlrRLG4+rFaGiL4YsPSeRCyH/Jint79mls8Sb9WXxhOBKr/hjlAX3hF75fJb93BDS+93R9v91lLrqY+RQuss/15c+LfF+PGN4nL5Rc3OVbGAnr3+446DnwE93x0sQ+dOI+yJxznoJUiSd6XI+gQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IqAzqNAQ; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IqAzqNAQ"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1419d3416ceso10614243c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:23:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791480226; cv=none;
        d=google.com; s=arc-20260327;
        b=VGUIuVj6bYXLtIdYLjTmHYx4IpKSLPnfAehIKhuaKTqGxjXIhkqarKNBH0njN6NldC
         o44jjCJGGx5obBjSBjEjYL7t/LkZ5atMSLsPzm4AdgM6/1ol0h40aiOxPZHBpBXHQv+3
         2m1DNBME53+UdFsJ5tFtoNsQy3m2mRFd6+dCAz4MJM9yY8CvPGuNfNqp58hUiPBC9Qnq
         MHHroa7m9G/wZSnrKJa7cyk7ytZkYboUTYs1koLQfxRKPEiWg70ZZFsvOellEod+wHyI
         sk04nWKYbUvl8lrM0j+rBcPW92ZSwU1y5sP7NaDVNuCSadeEBIZCDPhcfQaPi3vYj42i
         YPTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BHuqIf1tNL5IFXF1A87VrpQrMhtfq/QBoGyo3k89R/Q=;
        fh=vuzCeOedxNDyol/Nj7CD+MDiDGWVS7U6Xz013ubHnlg=;
        b=OcIaQv1odLAUSBcjITV7GAqlOn1oxGlPvhcZPBgWtqS7V8VbcLvabsGvLOZq/g/Om2
         hpuHuHN7tHf6e4JoTfW8J1rCc+om/4w11G8RDj7bNH86quiVrJ4p42pb+xvvxy/EqgQv
         7EHa9xvLdaJ4R3whHPSaa3x8MryZW5aKByTxVdrC46HURIp0datjC9XKQ+9PN3ZPLLKB
         QZrvKiVC152FfAl9q9GQjw0QtXRUYYfptidrKrsKCHPygzwr6POLvYNfQ3HtW0BJ47Zy
         /SNZg8SZ8YETWDTQfjUCkqcB2rLiRx0YrcRv7qgaX+UouciN5tVtCL5OHgd/ISCNXAc1
         J7xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791480226; x=1792085026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BHuqIf1tNL5IFXF1A87VrpQrMhtfq/QBoGyo3k89R/Q=;
        b=IqAzqNAQnNWI854x7LFCrWtlAzk0S4Q9IAI1wrs/acQcz0+ir6N7uyBxFCZa3m296G
         sBHp0fEvmrtIkHbMhAYIuNJ6ul+xLWI9PHPdAZnQMg602lDCJcwhIKbVStYx3kqWPNFH
         lTSzFKq+Oe3uQwGIvgtye9uclyQeCBERRgMC0HwppYCPM8zeYOOEWicHZK1r4KHk/n1J
         gkptt64FWittcYLHyeJdjZvnNM+oDiWb8p8yISdjjiJiT5PwazwoXVyX/xVwGC3QraCg
         9rEevCsYmulYsDT7golCu75qsi5/JMfzcZsWq3q67e/eXOeesPHrXgajCf4dzLNcmk/c
         X2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791480226; x=1792085026;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BHuqIf1tNL5IFXF1A87VrpQrMhtfq/QBoGyo3k89R/Q=;
        b=HEynctfgjNYirw+ZurUSbd93EhYBH3qTF0kwjxcaFmrrRv+VsGzPNX7hU/j+ca4jAP
         /Gl/Cc3/YDerEp3napCdQ0SxnLUsVx7yok3vWN4Xmu11GdytSBdyZbrnoAh1THoFLEV2
         CG2LtnNdDiI2v+y3mN8xIWlrEhQ3s9ap2GN1hq7IUOpNRCU7jDDVv919OVNijvnka5aN
         edZB1pmEkLOpb1zoI8I4HqaUipJ++F7Xtlt53BPSd0rEeMgTM72p0WuIpA9aoi+lBrJO
         07Lv2jDYcugFV3Qo7FSU7KShTyUVOuKZJJ4kg+tL6Fp1fdPJLB50krZZjveLJX1qxJi/
         x1AA==
X-Forwarded-Encrypted: i=1; AKwUvBx3bwWCRtejCgNqKZmszwRmWNbRGiNRFgIkpliNA3Ie/qfD++isaZCw17cVT4w8uTRCWCQzQ2/t7K/wjjA=@vger.kernel.org
X-Gm-Message-State: AFuF++m0QkgID5CgCF7+kQMuDE4cec+jahD6E1ELs0Ns5ZtVIRRrV24r
	/TVF+RAitEr9lEk4oaoF5Z14uJOiV5wp55tvSLOxaKS+HO+vo159aHZPw4iQ2rQw4zEoPvuZIhx
	moPYJgtxsn7GvCxc/ExyefyJPvLTSgY7vlHUjCnEG
X-Gm-Gg: AYBFou3ewDe2JdIA7c4d0rRfIrLPfJ18ocGg0EyxMLgksivEVsgzLrC65LyjBVCnw1l
	gowLn5182G2Tx97XnFcFovZkE3fOBYxAh6aL34fVDgMemucXXbjEBWvED5wpQ/FrdtPofixSQXu
	E4msBlbh0GaZfpfrQ0dbk2FCUFZSdCvVGmz979Z0maYCkyy6owLDIbAE6DF1fsp3KnGBEhyqAOr
	sQ1PRsRo0IsmfXSlMO4WxQfkdb2yV5KxrMKq07MTGO3LJ0HjshqdpXbjplHPyu+jfa5uyf5Z7m0
	feEMEhvEvylaC0NjXVcbPKnZtvTziJlcOEl+DhwMsEPlZpslhM9Jk+6QgbRgceNworbkeHkmIKH
	Ju2ElGhQc2nNjN0NxhKDX/0DQ4RXTZjhVKF1aK4G8MEAqUnf4rnb1d/TJkJb+lo7+6ctvYhbfUF
	5p3iZ1GU1TtG+Je9EKrLv6n7QP
X-Received: by 2002:a05:701b:290e:b0:166:4b25:8bbc with SMTP id
 a92af1059eb24-1664b258cabmr2798079c88.32.1791480224884; Thu, 08 Oct 2026
 10:23:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008-selftests-sockmap_listen-cleanup-v1-1-f6d1a4ff540d@rbox.co>
In-Reply-To: <20261008-selftests-sockmap_listen-cleanup-v1-1-f6d1a4ff540d@rbox.co>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 8 Oct 2026 10:23:33 -0700
X-Gm-Features: AclHuK_ZHezGCVBzzMpcKC3XD4J4SlpbuSoU0hDuFFatZm_8hkKxjtuQCg6wZOk
Message-ID: <CAAVpQUAaNR_vJq00dG67uxe=Yp18V_RG3Vxr7KL2u=dF7fBfKw@mail.gmail.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: Clean up sa_family_t-stringifier
To: Michal Luczaj <mhal@rbox.co>
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 10:12=E2=80=AFAM Michal Luczaj <mhal@rbox.co> wrote:
>
> Following commit f3de1cf621f7 ("selftests/bpf: sockmap_listen cleanup: Dr=
op
> af_unix redir tests") and commit 9266e49d608c ("selftests/bpf:
> sockmap_listen cleanup: Drop af_vsock redir tests"), sockmap_listen.c:
> family_str() becomes functionally identical to select_reuseport.c:
> family_str(). Move the logic to socket_helpers.h.
>
> Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
> Link: https://msgid.link/CAAVpQUDULzZh58oKkRaYqgM9bRToGb7wHrzT+cZNpRmAtM1=
2Ow@mail.gmail.com
> Signed-off-by: Michal Luczaj <mhal@rbox.co>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
