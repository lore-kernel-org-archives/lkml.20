Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793652793;
	b=dCXbRpf3Ik5Lre/RYU8TJ1B7G3n83EDrS1jF9g4sEjO6ke6uveGPgeOuqGuoLGyog/12
	 DU+UXPrD0HjZJRPO+4hQKCZB1NT9ct/hj1nIoeB8/lTxGY2wadlbv0DIXcB44zNAzgJEy
	 wNjhTleZj6g4Zp9CZeADhdsdAg7Q7lziTX8a8FUw1ex7IDaoxGyb98y9O+1HCU3iImf3z
	 rA7YIYG8S1qY8jpFFSRJPWsZe+aOdkLQqlyedISgL0CQDarEZYcAIAzLHLWTjitpHrVn0
	 xbNAKnxIDmA7l0LXNWu2OU9vIrdg/sFQ+nMXATMghVN6qSm1jalh3gf0J8KoW09eiGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793652793;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=117yBiLwKENKL+3PiWG/U5OMCVmGd5cgD5S+cpkVimE=;
	b=BNPG+Q6MOY+90Ppcb/xwONFEhaeeG5s9KzZ1NneqLlKaQpsoOfSyT37eym1tuSd/BYI5
	 xXZxyIe2klm5cnCuTXxBfD4GmrC4C7XyyzaNwS5jFYSpF0rhraaaIopRtJLynGoy+dx/M
	 HiKsUeDIOwy88ysPJp1WVEfmfpMDKk1/VZ6+oOPkT17a7NF8EfJtG/xpoC5aIV2dIwd6q
	 lJS+SVRqmzLwnJSmucqqaM/pN/m+f+2ZVK6zhnmCvQoSbFFOk5PwMwMh2/b58AJnTXBqi
	 OYzcPunE1zkp2KqlNVV5T2PyptFc7PJagvAaOORcRQxRYlx9Qp4/oiPpGr8bQTMLxpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JrjqNRqP;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ILbC3qNV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21111606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21111606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JrjqNRqP;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ILbC3qNV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793652792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=117yBiLwKENKL+3PiWG/U5OMCVmGd5cgD5S+cpkVimE=;
	b=JrjqNRqP10lz+xwTaT1N5hOMraQMewbNcL6ZPtYs/6qBeMDZq5lyggz1hz5TUE2wvCqKwM
	IXQbQRbVn/7mLpXXty1C0A86MwLFP717upzSrzHF5Nt1PiF43MqFrw00/Vf94oFs2+EMGE
	o+EsfhfOm9/h5ijPwHR98WSryq3gxtk=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-dZSgH_1SNWOFqSLT3dVAJg-1; Mon, 02 Nov 2026 15:53:09 -0500
X-MC-Unique: dZSgH_1SNWOFqSLT3dVAJg-1
X-Mimecast-MFC-AGG-ID: dZSgH_1SNWOFqSLT3dVAJg_1793652788
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3ab3061668eso242241fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:53:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793652788; cv=none;
        d=google.com; s=arc-20260327;
        b=pqRMUW0C1abNZbfaBXcyGQmOu7jXktjz1MHfu3h2zrAShnky+xftojIaFyvfU7Ml+d
         LkJpeON82NQ6pwmlTECUyLt39TnIDpc6KTr6nvlMdoskkD5PgIspk7A7q2fZgs+w3K6I
         0/HYzFSrg+6dkE8aCwywwzmeROOT1ElqVL6DGlpbkY8pEC/59YYYzqfKsFyQPbVF+NR/
         uryE0pKuZgrZ/MotatpR80QlRCvXSad7Wu856jYXnGlG+MkkU0/jPm7EYTXav2E2PFLN
         lXFnhKcmB5dIZIMbm7NHLTl6IsC4k4+L0P5uvrrzTxfH7MDLTwh1+H/Yqes+K7VkAdK0
         IWWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=117yBiLwKENKL+3PiWG/U5OMCVmGd5cgD5S+cpkVimE=;
        fh=J97K8ISqPPaRU0IWuCnle4X73D5UHv5WFXuSMnsU3wI=;
        b=BvIZoO2FKmzwiXj7sK5lOQhoXugzLzHHF/i7yiN11W6b7IjY4Z69GC9kNclVMSBzPB
         ag+0ACC60AdgoRoCoMXXCiOFwnLNmTqxfcfsEgN/ZQu7+xbQx8xqa2AXOdEv/JIfpvV6
         c9sOKZqZlhvRlBISInJWeiz6lgKg7167Uii8lK2nac55Ll1vUB5IjgimJBhfTUKW6RD+
         YndITPeRCd/iyP8xne75Hgr+UgZQ3KOEDvYZAE88FLWDuzsqHzZDCXyIaFu8h0Bl5j/n
         Nqqt/NXe41djFKvqvmHg7pN0OhY26vBEzrliqRJBfDilOMbIPj33pxZerczq3V3yQ7Pt
         7xsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793652788; x=1794257588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=117yBiLwKENKL+3PiWG/U5OMCVmGd5cgD5S+cpkVimE=;
        b=ILbC3qNVxcxSfLLqiEMczm2K9EWJDHjQ3jtHiRo8lvs7xOcCBk9KViZKbMYNn3rDyD
         1nRBZKRZevJudcNGThw44x8q3rGE46+/V3Lp15cYzXfiXGQHqy3zvhO0o48B5BncA5Or
         KbQ3kcHqkQQMolwwbUP9ub3434QutGVu8nmoCGzc2PCEhLmjOocqh+8d4XwIGdidYoBZ
         1xLTej5dBNXaVOsg0H9ykUYcbsfyfY1xRAFquEOh1DF007rqhduAsvbJpJIrCtz2kQKk
         jbQ0GJtS49pjk16tDcdcdHiHPoCzeSh4Rpt4Z21PkzyRrg6RuTlgqDQLYpdpsCCp4Dam
         yDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652788; x=1794257588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=117yBiLwKENKL+3PiWG/U5OMCVmGd5cgD5S+cpkVimE=;
        b=2WmEA9SLfjPgIcd4EBPR8LLzT2nRi3fR2i/0oxMjxOGOhqSnrz3NEJsbdt3Md0Pmpe
         SG8IX74rKoU9J5eYWi/ZOeRnVGfSXbbJeVQgvBNSkpcIA3cgYaj006DIYUxhGXYaLq0l
         2CVxIbwZz2CUacEngxZKrL4fdUHiUbv9etAvLbIdzTefGMNM3Wo+rasygrLhB/Zfyd6f
         kKtqI1RG+xHeYj1Tq3UljLjOK/eZ/8ggpz1DEt7oiDtJz0WWfDoXB9aqRD70GO4RmgxN
         mv4nHBGCFZbO/tvfvVfyQful6KYZGzv1eQgRBkdGA0U75aHQOb6N9MfGE0ZcFt6nqcWf
         eWHQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5skWlWuzpGZcLUX36AB6NolB59kMATAFm5FB+/wi3RhYkJZqL56XcTLmDsEzEQ2fIhipIM7sH7stiFeo=@vger.kernel.org
X-Gm-Message-State: APuU4Z92qfUzmQucuaqQuj8xCUE/oWPEF+1G2/ax30hXbCX2vfsI7PyN
	TuCfjGropZN3OveXrtZvsv4zRQdEWxAS+1o9f5VxiME+YfI2rdwkyMateAsvg7KR8xkh5OTIqoC
	EkGu8gOeOg7ShsfktR46YkVb/2uPuyIedKDmdV506h/EdjiCFt2+24S5s0ga5Utj0v6e2sSqzBf
	nMTynJX7AeuxSBxCiRDVjn2rxR79372isr/Fs/vRUl
X-Gm-Gg: AYBFou03U58d/DcUF7cq7Gxj9y5Zh+UnsAj5VmdKD2P4nP9nv5FD+PvKA6yibTuuPbh
	hr2ymLMeYTCL+wL8cFxnAObpEZoj5b/5ytQTzmidwuhwTGuoc0sYRET1P1sDOnaVX2YDDEFih3W
	lIei6xd4h622EwPhJse4/Y9ulXx7cyoARSYuCrjz8udug/5qwk52X4JJVo
X-Received: by 2002:a05:651c:a14e:b0:3ac:4b79:573b with SMTP id 38308e7fff4ca-3acb7aa83b1mr20499061fa.13.1793652788247;
        Mon, 02 Nov 2026 12:53:08 -0800 (PST)
X-Received: by 2002:a05:651c:a14e:b0:3ac:4b79:573b with SMTP id
 38308e7fff4ca-3acb7aa83b1mr20499011fa.13.1793652787872; Mon, 02 Nov 2026
 12:53:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027223847.652884-1-irogers@google.com> <20261027223847.652884-6-irogers@google.com>
In-Reply-To: <20261027223847.652884-6-irogers@google.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 2 Nov 2026 15:52:55 -0500
X-Gm-Features: AclHuK8pGzNf4aGPekLa6NQcs521xOugw8djA3E8ZMCjZ7yn89XzG5j_wIaQNFk
Message-ID: <CAK-6q+j-MS_5St04YFU11LG_Cjf1jOuS3q33qk_iK=7TE-iuBg@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] dlm: Free dlm_ls in kobject release callback
To: Ian Rogers <irogers@google.com>
Cc: Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Zhihao Cheng <chengzhihao1@huawei.com>, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, 
	Sumanth Korikkar <sumanthk@linux.ibm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, David Teigland <teigland@redhat.com>, 
	Greg Kroah-Hartman <gregkh@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 27, 2026 at 6:39=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> struct dlm_ls embeds a struct kobject (ls_kobj), but dlm_ktype lacked a
> .release callback and dlm freed the lockspace structure directly via
> kfree(ls). With CONFIG_DEBUG_KOBJECT_RELEASE=3Dy, freeing ls before the
> delayed kobject release runs causes a use-after-free, and unloading the
> module while the delayed release is pending results in an instruction
> page fault.
>
> Add a completion ls_kobj_done and dlm_ls_release() to complete it when
> the last kobject reference is dropped, waiting for it in free_lockspace()
> before kfree(ls) and in the new_lockspace() error path before module_put(=
).
> Also delete the kobject via kobject_del() before stopping dlm_recoverd
> to close the window where concurrent sysfs writes could wake the stopped
> recovery task.
>
> Fixes: 3514faca19a6 ("kobject: remove struct kobj_type from struct kset")
> Signed-off-by: Ian Rogers <irogers@google.com>

A somewhat "big change" for just a debug functionality. Althrough I
agree we shout call "kobject_del()" early to avoid additional sysfs
changes during removal.

Acked-by: Alexander Aring <aahringo@redhat.com>

Thanks.

- Alex

