Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A8D1624C0
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788001057; cv=pass; b=hqOZ1/H2FxoNTBlguq8Hc21a3YjyAU0zslPPVMdcAWBLWBhCD5sJ5/X+rTeIJ/6KK7TKE6kge2XuWXr57QN2yRHfj/8Ui0qOfUqwUuqkFfm/HdcP+iLnGamKH8VQ9IXcuoRVdrjtecboEEzhE9ZFckGqDu665o8X02uXL3vKhxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788001057; c=relaxed/simple;
	bh=hsBKohLfCZd0jfnALC1cEzA++W2MrcDhahlgqPLVM7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VmJ0qU20IDcrvW6qZpI3WdCxy+xyc1FoD4Z+6NOUWO88PKINuLgw/4ZJ1tV9/cgO/hInc6weCGtnJJXDauhqc3PyCJJB1or78Qhi2Cqm0nsorfwg1Ew2DrmPRhRRaFB8h5jXRzhcs7iA0nZNmFVEAI+XHfrDt+Jl9eiOatUeb6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qxB9/ucO; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qxB9/ucO"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d8f2ed7bdcso461485ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 03:57:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788001056; cv=none;
        d=google.com; s=arc-20260327;
        b=IthrXNUcscOLjF5bMRZHqL7IaQJQ7NYwyiw9GkoMTQvuJFNo4pSpo0tmJrf4fKPObR
         YhGXxDlCE4yfiL49m99ebLu6/ayYO9MLcqLJCjPX1/WugqikRrD9hSQR8A04Guqr5Q8z
         1YY27juBj8S30+UIrEighfnHRrVa+SmovRYqEJKYEDrfFVt3s/3xFFR5GqHM8lBUHeiP
         zMmW8EmixvegAFAzCi+k4dKsxj5Z2ch5wNsgl2US620p3WDWWFR1p7d7/IcYdJpCxPaM
         3xoN+JC8KS4zMkB7Z/VWx7iG4OchTYmaNM//ucsjh2Y36MTCA9P8sMV2LhW06VYSMxPc
         VD6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3yoXZjSinVl6bLZjtfCsRoIy2CcONJCPzcPUWytAk2w=;
        fh=jDzMYz5MaOYKHOMNIrNCVTsZdnpwhViGOvDjH3DuhSQ=;
        b=FhRSas7yJ3eOV+ukiNXOTuHnCKZk+QuyJsPEtkA3vOOCaACUnGmrnkipdMrvMoFZU2
         f/1s5ecOnyFK55XfbUyYOxdStAx14Mz/mvZ1zQOxGGlHQhdd+vXcfpUcpzWoe16oK2id
         wy314927qQtgkuYHi5BxVwMcK0vQ42XmE/CB6czAgzRxTraoFpZ0BoUj8PEDSY+LfHb4
         AcYIl5BtEkTnBpBg8gd+F+tedLkfZXI7l7OPlxCzFgii0muvUk8bKi8McsIobgSiIpmt
         JRbEnfB4bnUx1aRjDoGRXEG4wtO+WNQp5Fd0hJTa2cvfQ2is6fZ26UvbGHNe7lbyLrpb
         LsAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788001056; x=1788605856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3yoXZjSinVl6bLZjtfCsRoIy2CcONJCPzcPUWytAk2w=;
        b=qxB9/ucOSNJYhkRxeEyJuIaaChnbkIeziSSD+2tZkrRhLbLNtPwwaw4AnOsFMkGHgH
         g8av33wNg8aFOi0uNrjq+Yypt2oDfrdfygCqbkDmAzG5fuTS1GaoG3u/rzSOQp64bZcr
         Wr8t+It1pfy/S1oP/PjrrW6Lt8BGDP9OyfNZoC6PKX9aTpe0hvxrhZVOb2JooagrMlPz
         TUMkgAqwJXV3g83TJ0bJH6Fnm2rHWOxxW7ClpQ3zjd3BOyBL4NDx9juMBCRdInYkLope
         g97Vy96kHGCKy87vUJsdUFVo8/sZJhGJwdy6K//5s348jFOgAAUIsevfCJRcwtlGtwCE
         +tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788001056; x=1788605856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3yoXZjSinVl6bLZjtfCsRoIy2CcONJCPzcPUWytAk2w=;
        b=ElnFZ4tbe1xs4ALWwFdk/cLNAXvv3knOcRI6qhjBtjLt9mnRA3tTl3JbXB018ZQChY
         5eavjzsVW6XuMvIOz+x1LovzRa0gMS3J5sq36G41UpU9RC/JQVs2dV4SsIhMzclIFnGb
         Qx70mJ+Ysn3rQBsKEfEeOOc2GisuZfgwLdJpjKZwfhBUxOF5zv1drNJec2DufrCKTa78
         yeo3oEwuBGZBz7XudlDQpHljVAwoD/1/Yw73JYW41VynkfeFSxWlmrGQCs0KlG0dzX+O
         TFPdT4DGe/rSSPoPHw7Lo97cTm5i5yQcHDaWokmh/srEx3SbMCNArINO6xjspMdGVhMw
         PPpQ==
X-Forwarded-Encrypted: i=1; AKwUvBx65wbMQrEVil/v2RK/CJVBwpdQCT2JfTNbHd74KJzeNZ+p6RM8EHApJdRfLjTs/XKrUGOg0E4b6hU/i88=@vger.kernel.org
X-Gm-Message-State: AFuF++mMyG8NgCFQVP1Jhu03uOylbCDwc0E3fE4+33yAwvWfUXRIcqiW
	XHK0V8zd5h/WFWXeuodrHP7qFUScM8g3YBQVL+GXstw5FPOApLVfpFcqhWcbNo3FOmMvebccQ7a
	AV+QdDqGKr0FPPR1FWjqw5M836L7oZ0Q=
X-Gm-Gg: AR+sD12h/3iw4vrM36onI84Dan9Oa/7XkHs6+WwVBaZJLitnQvnZzZm+qgv5Hmh3d9c
	NWhvWO6tC1P3EFgQezsIj2hndNE3Farr0wqI9HybbRAcgbBHLUb5XbK+Zc0V+ray7JQEzwxWtDx
	c8F/0N1DXE0kUM8xiwJkFUAhFP1LhgXYliNo5GZ0MbjAZV5ck9YmxDgzsjOGR6hI4k0FGa5Fqe1
	lw3WJ28nmM/rrljH6IIa6gFq/HwaYv8H2X5J/2bDpyH7fR2Ad9ZNIL9WV0zfznqCqQpzzf45YEX
	4p/8aLIPc5dMO0ksOofYeotlg0+8dfjCrP+WKe92+zDccMO434ieCsfEDuu/FaaaOdD0R6eNGqk
	cp5duIun6q8XTO2iOleTszbeRj9Gxyf6kogAOTn1X1kTBl0o/kgPjRlXZHSM6
X-Received: by 2002:a17:903:1104:b0:2c9:8287:fd0d with SMTP id
 d9443c01a7336-2d74df62ccemr115727945ad.3.1788001055774; Sat, 29 Aug 2026
 03:57:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
 <apG3hwaPA8f7SJeI@levanger> <b45e7864-928c-4b3c-aa62-64f4f63d85c7@gtucker.io>
 <CANiq72k6T9Y_Vubih6pFMQBxju2xQq0VQkCXT1WL0qSyCXKxyA@mail.gmail.com> <9a3eabd1-4057-45cf-99b9-9c3c1b6260d3@gtucker.io>
In-Reply-To: <9a3eabd1-4057-45cf-99b9-9c3c1b6260d3@gtucker.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 29 Aug 2026 12:57:22 +0200
X-Gm-Features: AcwNN1U4Xd-ZPEH0J5NkeG85FCsQEWIBZhyX8xsSVfYp0sl8uMCqeYTmtDyhT2w
Message-ID: <CANiq72m0eemCPbEAvZSC49OZHyaNvQgbMdSDphT01no1B+YWEA@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts: add TOML config to container tool
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, automated-testing@lists.yoctoproject.org, 
	"kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 11:02=E2=80=AFAM Guillaume Tucker <gtucker@gtucker.=
io> wrote:
>
> See "bc20c56e98e0 docs: changes: better document Python needs"
>
> Also it's explained briefly in the docs here:
>
>    https://www.kernel.org/doc/html/latest/process/changes.html#python
>
> So I guess that if it's needed for at least one build configuration,
> then it's not optional anymore.

Yeah, that is the commit I was referring to, but I am not sure what
that commit meant, i.e. if that were the case, then e.g. Rust would be
mandatory too since it is required for at least one build
configuration... :)

I guess the commit was trying to say "used in enough places" or
perhaps "the default config of at least one architecture" or "some
`make` targets" or a combination of all those, but it is not clear.

Cheers,
Miguel
