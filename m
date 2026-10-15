Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD06352ED3B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072899; cv=pass; b=K78iJXrvNfYcDodMvRjZj9xIFnjvhvl9mL2jBTt3bsDJXoaASylQElYzeCkq7t8Qru+GgZQy4QN4Yp7gt3xAMEnxHaBJKku81exlbMPt5fVI8drKZDCKUs0M9Dmr3pIBUUsa3JRwZtGjgIo/ii/Me6ZcLHHf/Om4b/99yaCQknU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072899; c=relaxed/simple;
	bh=4ZfpOmKAtykOc+d/fnv85GlpzyGWVNRtTunIrunGqws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IDaIznayrackuenYy64mN0AqoTTgosH05W/D4YnqjCbNZ3O3aUgsy+V97WgRImaSBbkI1v54LVRKzedzMoFZntJR58YdJh2mOscXh95h1Q7grnNbBgQwlzRJDlgEYpcQUW2M8z82PgZZAuM8ZvPbPcaeiDheihKM3bjgwPBtzgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WA4wLEfo; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WA4wLEfo"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6767d92cde6so5481536d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:01:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792072897; cv=none;
        d=google.com; s=arc-20260327;
        b=L/5UBTr+O/qJU245hD/1OY8TrujHy8CwIejTjVdVYvgYjUpITwqhJeUdBUBo2fdFKe
         zqqPsrZCA4SLKTaFZXw7PxvoVtPn/lP5hYNsxzK16/rvsLzFVgwQp5f/7pscaFkxxXB4
         CzdZdOFaFGNAc+lCBb2d/ApDGH5PXumq0iGThj7mvuBoeokI0j+EYsWCpfxKPiBUsxli
         yHHChTGqJgDfTzO8vMnO/f6EKlAvipcM5vsWAZelgWv132tM1O5IvuujcoBOlGoAEvnE
         gIhnmhtdVattxv5DVVrYHahAiPsenRY9EGc2NLt/7dl2Oza9rM0M1jy1kcSfVrdF6bxx
         xYqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4ZfpOmKAtykOc+d/fnv85GlpzyGWVNRtTunIrunGqws=;
        fh=/rpcQB9C7zhchs9SaZgdWlhG4poI5FepUEjo/Ax7Yn8=;
        b=GeVqSmZgQz5mnFIRCEvvwB/gTwkiGurNXtDPFTmnG/LFrqrOUZUCvnyoE1ddcaLd8G
         g6dZjRe6Kbdg9vUYWIg7zzUYV1ZtzCtCrFRNNERdHWJroG86o6EK7ByQwHXzVFVy/o2/
         k6ies23qBr+3zsPmpo0Vx+JkdpODYaIoj3ctMs5CSVh51R7jJxQk//N2DyKh23Ithz+H
         WZLVGRG8qsYc2O20b/KSBdSQMLVrQL3aMFTp3VOX7/bL/AzIYzItAnGNiEQpNflcQfeU
         U1tFDFy+RNFLfSw+Tit1dhsZU24PCU8d8NUyigvizzGQKsmvGM3XzwWI1ld8FKkvyVIP
         +sWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792072897; x=1792677697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4ZfpOmKAtykOc+d/fnv85GlpzyGWVNRtTunIrunGqws=;
        b=WA4wLEfoyG6rh6TsfXqJoAzg5Ua2VAnQSYdURZ4DMSOIedZeW+A0C5YNEEmg2+HONH
         gKSS5WG1Wy/5fuKYnTItz1gaNfpZrN3yjVv1ELiSNZgM4M2yj4xZIKcmeIWiLXMe7vRI
         HIpzkzYu2yM1QTyd8ZVf5cksBD7qLZ5OQS1TPY3ywt3peTHc3i872/VOkmQ2GYviddS8
         Gl4He+VcrJ1pAw/AjeBnrQ/A0v0eFN06QaT1JBnr3gkHvpgrNqVObjsvImK0dKhCx0zt
         YGHzXXy/JE5+mujZEkzQ8TdvsF2AK5nkHBdmXhw6MKPPMr9L4EoVR/vvuW1sWyuD8R7I
         TsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792072897; x=1792677697;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ZfpOmKAtykOc+d/fnv85GlpzyGWVNRtTunIrunGqws=;
        b=rrBq6drEBWyl2LG4R9HqfMCq3rJKSZLs9w24OcqFYhVkfjlufiAPibD5WMzPsRH3Gy
         4G3bjYF90YIpAbBXmaTs3Kl4FXB2VUWGm28mZnZC/sBaEYV8iq86nsctl7HWFX2DO4Px
         Wpn7TUneOJNmW16HuUsxBGFt0BDyacD/Mrq9oZUm1lOnvXchW8aDPjWeQd3uCQ2mVlgm
         dB39dEdL4Cc8QrTPeCZqnMzk5VJSL2b0JHpItbAuDoeUPg9TaC8b2M0eanVCn1QUWcbD
         Wr0X5rz0BoAcC5Xan5z4odqbb4UDR1xZClVLk2i1AbV/YJBEl/IsEfRBYQRrOCVieYi+
         JPHQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5IkWiCGAPPBr5woZzpGmJ8iw4NPDoyvcdMKH9/MDSqlwhS0KUuhRluTvcL5GJuyqIrfZ0o7OAYlKOQrE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLT00uz/osuTgMtCy3P3Y8nY47e8J9xRs7EQLOSWcxdd0uTPqwF
	mNvdcb4bMl080TTeYfF/EUnci+jdMUnAWj9ZNe7CsGn9msjeb+DY+pZpheNxuFvJHjxDQAI8hx8
	MjcgPAEpxoncXoPmrjBmOLdiUffiLFbg=
X-Gm-Gg: AYBFou39aDXjxaG3lC+rYDFVyy1ZlUd2I1E7U3kJErXtvJrHs9MIj+m8y53QsEht90r
	wQL/sT5g7R9Peb8rwTBS17iMVMV7Mj1WeCi1LGGJZ6PeDH2FDdcWq3moMN8byoU49MnGxMDn2Lz
	nzZ+B5QAy7eoG+0YhcMJYHpsun8QHWKYwxqyB2LO37ovzB100iZufX36D/NyRwV7OY4jAFoZzhG
	2G9J9WwI35nGpANHSLk0NTPYihnwvJXjcPs+bdh21TQcZye2Zlt0iSx8ciQk0NGyziZtqvdWrFP
	T2oFecPIQhpD57fxEKAD2p9JJ9F6dGaSgv2xxSV+D+kcZtGmxV7YPMw=
X-Received: by 2002:a05:690e:134e:b0:677:db69:cc1a with SMTP id
 956f58d0204a3-67935ed6114mr7100720d50.7.1792072896630; Thu, 15 Oct 2026
 07:01:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014160741.222219-3-blum@kernel.org>
In-Reply-To: <20261014160741.222219-3-blum@kernel.org>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Thu, 15 Oct 2026 10:01:23 -0400
X-Gm-Features: AclHuK_I5_tvXYJ71ZFBH3sU-3OKO_yyAB0kwxjx4G7oBnqckAyxHHPbF4-yx68
Message-ID: <CAEjxPJ5tbPLOj17dwEDvzVNEJnEgMy7hGgFzEe8MYwzVxU1smA@mail.gmail.com>
Subject: Re: [PATCH] selinux: use isdigit() in selinux_genfs_get_sid()
To: Thorsten Blum <blum@kernel.org>
Cc: Paul Moore <paul@paul-moore.com>, =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>, 
	selinux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 12:10=E2=80=AFPM Thorsten Blum <blum@kernel.org> wr=
ote:
>
> Use isdigit() to replace the open-coded implementation.
>
> Signed-off-by: Thorsten Blum <blum@kernel.org>

I seem to recall seeing this same patch possibly from someone else but
regardless:
Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>
