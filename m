Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792990120;
	b=dQq9CX9re3ZD4YhJ4ykMzibIZCYouSMa89RVYn3Z4NliWH37e0Dl4PyEcT8ZeAWb8T6Z
	 WkkVdAlQVb2FEzG0/clAGBkY0xUD39KnyEBt89raGgzYZ4BtT6WciKdT5JotsK8y4reCn
	 8MfUeSDVsq6WOhD1drYh7dRKz9H8kbCrNeHBQUjpMt3Tx5AjPOG0W//qiuqaYUvYjc/dg
	 Nk9EeZ3TK8PRgigD1DpJ4pH8vTK7o9E5i+AVIOwn5KjqykuM1+K5+O6x7BqhhdvcB2jyV
	 tmSIelfKZdF2lsaV7zUpIyx2+QBEnTrJEk1h5fp8sx/viCAm3bBIM51jcn+QhOZIMZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792990120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=56Y4H+QOpsErxz20UwuJ3uqXiwvb5kpke2jcTVoosVI=;
	b=zRE5GRsUOlwt2mWMyJZ+7rTslksPw7awIvhYiXxoKB67hNmPJqyt5rjd5/gWZhDx3sXf
	 PAKw/P1NrMV9/1K07sNvb2/kbXOujbwAFgNTa2l1qt526kC4BC3+xFLuHmyZx5rB7uLQd
	 uIhoSfBi0qXQrpPWNQHci71Tdh6kAEhUJFA+el8w8IyF9J1CwZOXnzjo6t1x2T4VnuzTu
	 h5CDtxa1dXF9gzFBOdQw4usI393wfBvNOaDHQePNAeo1isyQgKdDhMxFMJxy1MDeNpZMc
	 VI65sq7M7nQskZjZPqn+g77FtSKLDIRzJNImLSBC5k51uAQa4wUQr90PWrj4BJ5+5Vg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="WcRmM9L/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C31606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3C31606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WcRmM9L/
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6e560e00a86so1817240eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 21:48:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792990119; cv=none;
        d=google.com; s=arc-20260327;
        b=nO1eEjwF9q43VrpPuLAaA/5K9sruH5Tx5duCX+tUXOH3jxN4japX4sbBRFHkT7ENxk
         PSVtGQWYZ88awCrerjT4srOkkNfVhr40du6VJgydESAPnEJ6cx5/O3CWNVD0f9y6wcfQ
         QvjuYQYqjxS3+o3cgr4sFIz7/lHXSMI4NcqoHVVELp4/ckvnkjeDhyvFzXZAeQwPHQXa
         3OVEWcA6EdSX+6fOKFJFKCriu2tA2Ol/DY8SyyUx1ih9KmhWXCua7HmOzXicvA6ZDfWA
         OsXrndG9SWurQwn5RhWF9BLxZlwMryrxPipxl1bgivN+QYphQhqPc6AVgDSqFNzOQn4f
         AQ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=56Y4H+QOpsErxz20UwuJ3uqXiwvb5kpke2jcTVoosVI=;
        fh=k1354K/vN80OjOItMuRBJb1K9I71FlZG3BzI7RnLGIk=;
        b=dakr+fhaO5ZvoBPOycROAKGS3LVLecQs1J/yDSmUofYPjDDDnxVjRG8Fmj1IrA0FUV
         Ctjf114dpOagLzO35RW9Hjx6AVsZbv1YlOqF7bNjzMRWTeGtBhG/K0KWo0isys2pSgo4
         8YBlNNW7b6pq0s1/234td9EjWDqTo3ejw45daxC9qDH+omY/JeHfq43mq7awtN6ZXDGh
         kXHEvJuiYeq/IUHHW6QHGE3xCyzZTRNXRf6ogdRYDwP78DXw+hTcfFtmD1SbtEZsOG86
         0g36CoBbiFezmg5bw1yhtlNPuBQPvaNqdfGvGQYan7wMMUonPEj3uHSgEh2ugfUwzLEt
         H5tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792990119; x=1793594919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=56Y4H+QOpsErxz20UwuJ3uqXiwvb5kpke2jcTVoosVI=;
        b=WcRmM9L/sz/H8KG2lOQoxvJL91bbD1aAc6eXQLxZ0S1g4ijInjZdX/ODV8kbStiyLy
         vdycIwd8tpi+4JUedHMMMDoPSCXrGNGFK0j/qKp3oWTukFMMWEZk9yseU3c5dVSXmP58
         EI9K9dr21qIkcAmJKyoh+wGN4fK0f/mpfO+AAZSriOCLjPphGkFwm5OyVxI/+a/hMnUu
         iGh3JYRA/rO8hd9FBczh3DUAF3pf4Ad3OaxYdGxaY7ucUNLAknv3qeopjkyGSGVwIAHt
         x9acQVIjCWfV/KQ9XEU7yPhzV1lnvGn2knV2ArxKjBQsKyEA67gxSRMWeqOa6lq2w9At
         nmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792990119; x=1793594919;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56Y4H+QOpsErxz20UwuJ3uqXiwvb5kpke2jcTVoosVI=;
        b=bH13+2gtiCGGvDTNbEZt1qqBLse8PIh4V3ubfY29kQO+nB2TSmbtUapmV9TZXMuDbc
         K1W18QLs2Ll45+eDl7VchPG38jpta2zjUQEkqUTk2M1R7IDAsqsZgr4DZ58ja1A7qW4Z
         Gsa6eSDbp6VfXW3r4hLpm/Ml8eUfKPLffXhP6bNF4m9CW5UnXiVPbMNS1AzClTs7IMli
         803o2EEFQDBveBxIzO36yHm1gLvUyMHZ3GbMvz33kLLdLUYfgrTxhYP1wcuyrAIHmTKl
         E/07jvWpoBDWbQmxbBQiWPk6SsiNVBw3JuE+zTVhtpwHuCVtHD+9VoFSa5vVYAUUI0nh
         J7Fw==
X-Forwarded-Encrypted: i=1; AKwUvBwI/sypclN44k4f7wFLM/q75buTm/fd8uZJ1ZAnXZD9j+gn/A2MyAzOJL9jHbZbW31ll9aObC/JncRiAWQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8D1QSLMQ99Za3UxQ+cJkvG5eYrbMRE7TsumyZekSZ2THXoMOw
	AnUAgZ8GjS5KhgFlAXT6RsVVWdT0NQu9GkRZ39PwQ2VOP2PlHn0w46vwlgYjDPrN5+E4OAClzpO
	C0BZyHxjwgo6p5rgjvZ52mhpCSA9wNDA=
X-Gm-Gg: AYBFou03OddBEsmzfTsMQnodZy7aZ7d4WPlsbx3S5CqhKaj4/RnfXwmR0PCby0m+IxL
	w4GOUVkiueuk9gorObxLHnnBkPoY7CBgJ06LBkp9j23/cpfZkgdVYqN+hlaMc4XfKclysuTwnRf
	Jg6Ccjn9PE9TYHWbroxqDc9vXDB6qaRxtO1PaixnIFVK+lU44SE6FJlnAroLwdkp4HiHEhIluiC
	eNExmE1qERjkPlG/I7en6TpZLJnxCudnVNFN3rq9vHCic8LeWsOWPMzea0U4e62ho5Or1iRJPjl
	pPQhfN5lgNxn4DJawozAkEnL3XvG3JEA2e7uUymCZKIRb0gisxBPcHhNFKvAShwwHzfm/HGO5My
	OKkU/5cghu5k1AMPhla+FOMHeFAZAueEdSv/VjRpe5UpfngFAclDwQEqp+g2AZFqSwvS+B94=
X-Received: by 2002:a05:6820:7184:b0:70d:a53e:845 with SMTP id
 006d021491bc7-70da53e26e4mr1017756eaf.17.1792990118754; Sun, 25 Oct 2026
 21:48:38 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024180803.108872-1-himanshu.bakshi478@gmail.com> <at4Zyt9QP3Yo-ZTC@ashevche-desk.local>
In-Reply-To: <at4Zyt9QP3Yo-ZTC@ashevche-desk.local>
From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Date: Mon, 26 Oct 2026 10:18:27 +0530
X-Gm-Features: AclHuK-hrVr9XIOU9ZgMN2G04tr1CEuz2jBrJcJQCkK3Fq75oom0ajhxJqnjf-0
Message-ID: <CAGLmz9+B4bcp4WKfBzpS1nO019J3yZppeGKx-ZgZjncik5e4Hw@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: Fix line length warning
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

I have sent over the revised patch (v2) over the mail, and will be glad if
you go through it.

I have made sure that the \ (backslash) is properly aligned to the same
column as the rest of the macro. I have also taken into account your
advice and hence added a local variable for platform data.

After some thorough searching through the respective directory, I have
not found any calls for fbtft_init_dbg. This might be because it's a
helper macro that might be useful as the driver progresses.

I have also noticed that some other macros around this one have simple
style issues and if you would like, I can send another different patch
cleaning up those too.

I have also done minimal testing by using the macro once to make sure it
compiles and has no errors, if you would like, I can also run any
standalone tests for this macro.

Thanks and Regards,
        Himanshu Bakshi

On Sun, Oct 25, 2026 at 8:31=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Sat, Oct 24, 2026 at 11:38:03PM +0530, himanshu bakshi wrote:
> >
> > Split the line in fbtft_init_dbg macro to keep it within the limit of 1=
00
> > columns and address the check-patch warning.
>
> checkpatch
> (in one word)
>
> ...
>
> >  #define fbtft_init_dbg(dev, format, arg...)                  \
> >  do {                                                         \
> >       if (unlikely((dev)->platform_data &&                 \
> > -         (((struct fbtft_platform_data *)(dev)->platform_data)->displa=
y.debug & DEBUG_DRIVER_INIT_FUNCTIONS))) \
> > +         (((struct fbtft_platform_data *)(dev)->platform_data)-> \
> > +         display.debug & DEBUG_DRIVER_INIT_FUNCTIONS))) \
> >               dev_info(dev, format, ##arg);                \
> >  } while (0)
>
> First of all, make sure that \ (backslashes) occupy the same column on ea=
ch
> line of this macro. Next one, it's better to add a temporary variable to
> hold the platform data pointer. Something like
>
>         struct fbtft_platform_data *__pd =3D dev_get_platdata(dev);      =
     \
>                                                                          =
   \
>         if (unlikely(pd && pd->display.debug & DEBUG_DRIVER_INIT_FUNCTION=
S) \
>                 dev_info(dev, format, ##arg);                            =
   \
>
> And last, but not least, have you checked with `git grep` how it's being =
used?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
