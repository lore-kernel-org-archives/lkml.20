Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC875563FB5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790094875; cv=pass; b=DMreh8PoMPTGKsIAv5UW4FfsbDqGUqy2MWEjA58Ergtdixk3M7YEJKDodwKpA5lwFRgXet6iAu1L0PeBiI1l/GTXEjSd0bCZqzhpft5AUXajxl/1CiU09IAI36fjxOZLLBSNfUozrsglN0BBgxEMjFqqIilgQeh4gek9jWUniEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790094875; c=relaxed/simple;
	bh=cKbRWUWUNFCMJjKOH3yHgRtEpoahj/lRVoNkkOfXTsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XntiBYBH9Xa/8KL8kswZzkS5pTuExIvGBvVYUyaCxzOb88kRopBdMaHUyOhBrxevFK+1UhY1qfUTmWWZze0YFRSmH0n34UBPnegGGZ6muY4IOm52ykSkwqn1piKS/2L+W4eBysxGQOHHqFZ1UEX65dAgh6Gyqx9Ur8WolxdJE7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AB0zXoy1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JFcMYyPe; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AB0zXoy1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JFcMYyPe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790094872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cKbRWUWUNFCMJjKOH3yHgRtEpoahj/lRVoNkkOfXTsg=;
	b=AB0zXoy1Yvcm012ebd22g93OJbpurDQn8u1uHe5d8RzsT3ZMpvCxh+yo0EUJqXz7bfpG5G
	PKjxa7qRnG1F6zZ1ph085yF6pgjNLW2brVmm5iZ6VKBRiBZG/P9YOQ0hCC7epr0C7KjsEH
	+G6OYZB0KHfZrCFF7neyM9Bu0OgJUss=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-wq_cTprwPHiPjyOAC8Xa_Q-1; Tue, 22 Sep 2026 12:34:31 -0400
X-MC-Unique: wq_cTprwPHiPjyOAC8Xa_Q-1
X-Mimecast-MFC-AGG-ID: wq_cTprwPHiPjyOAC8Xa_Q_1790094871
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c82fe2ba8aso42116e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:34:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790094871; cv=none;
        d=google.com; s=arc-20260327;
        b=AEz9//VC10yoKqdgVhH8aEgGilfNCtMLE3v63SPlywSX4FrV3lave9GKZcdkT9o5oG
         jl/afGqkJK7O4U7REDBwkOJ4sbktBlnFxSFAEnf4CkLUXWqS3qYtU4pa9Z2sqvw6gm8Y
         awTbLe0eF7H1TlELG1DPV6Z3UpOn5yVK8rSTn0waH9xaxTpt+29+ngRIkgXR24+4Gqru
         WGW/8VydeZwlh1j2x35ZhtFfnZ6Ryf8LWtwo8skcOo06JCeCFiYPKmADYc8DeOVZ4Y+9
         0plNQTPVxMOTlB4qkMFoXkutorRK9KsqBFLJBcs87AdIp7E8LikJPQkM1GPiNouBrwCJ
         kU2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cKbRWUWUNFCMJjKOH3yHgRtEpoahj/lRVoNkkOfXTsg=;
        fh=ab3WpTtD/uBjnCSSN9gOrL7TAZ08Mwzp3OBxz0wnagY=;
        b=YM0D32TQyDFMePFyB2IjmPOFxTtnSn9EdtzBbKXWvOJ4Rlb/NnBS2HhmSNN/ObgcPy
         GdH0kqYZnNb1zPLWVF8l11BOUWQRYQoqXKlbAFstOdovkas05son0mPNGb/zTAVL45FN
         DPkPNbzsEiVNy/P66mHaQiXkKgDc6nd0tO9tPZ+hN5vma5Zn9+b0cXdX5NYBBvtOeN14
         +ufDxqVAhifz8Dr0y9hyUOChrkRqt+i7YlfUvk3niKAk0ecyhB/eAeGQHEg7EbfJm4hi
         MPSprEIp4PBGOIjvg+QOU9Rnnpup7Cbg9X3kgl+nqUN+hsmM8LQVHvj7wIeIRcWaOB9S
         YzHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790094871; x=1790699671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cKbRWUWUNFCMJjKOH3yHgRtEpoahj/lRVoNkkOfXTsg=;
        b=JFcMYyPeetOC3hyTIz7DST7NcJm/TD2yslUQK+hCqUdwvXUmtVKbN0d+zpIZeZgn8Y
         jXJI+fN2UNvqdUyxVn82tW+X7LeTaGQk2lMEzdOb/qnOt/P/zs8ekhAR709/DXu2pqbI
         tmypp0UV46TG+3QOXq02/QrBB0TCpP3ijZ4kuNt+t4Ky2k0V9/AO1KOX2ny4Hh+LpU7w
         8LVC9qZOG2XvIbt0hv2hPKHhDP3p3gU3eu7iSzsdHwJZmgol+OPguRIknGmsvd6tKN/I
         Mm1dFUaIxmYowaQ7hFLa0F6kZAVKr1BxRqBUSMFHRbARJJb9sZCozHRdRNvxpJP83tJM
         5jnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790094871; x=1790699671;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKbRWUWUNFCMJjKOH3yHgRtEpoahj/lRVoNkkOfXTsg=;
        b=OsUPuXc2rsPQBQ/uYR4nf4l3DLQSKcFc1Q+Q6jyxFHNUXD8ksqZLJxqX2fDyEtFpHY
         +BDX097oukUmZM5vVA7n0jgbBC2juUNpc5nYEwDu++vxN28olI58Odi5Zvm2wyB4Tg91
         dyfjiRBAlEieNPGpWm6qrNy07NZR/gmHb3xQcMYsAPv0XLqhsSzL2ZVuv2Cpb/WdWJgc
         oy41wzWguywC+L59KOlFpr+lVvLLXDIzWPKdZhS9ehN3fWUh2X6fUMNU1l7Npk+cofIu
         B8hF5C14u3rmF44yBg35Op5PryKSywAjxWBn4jKUlq2N0DnK1ygxaoK7N3kIawoGxDK+
         0y3A==
X-Gm-Message-State: AFuF++nTSVO/G6H1JoiJMkaT3EqqkhS/ZhMMKu8vVZy3VX01kUKAUQpQ
	TQ8Ctrp5Sods+NFZYlDEi0eyZTHJTHjtXAKxTIX/7UlV7hIekbPewnZ+gjoseOfWkFaAouux3Q6
	5v0HfUdlrVjhd5ZSe2KgCyEzt0W0FaVvkUqNmWyQ0a9OoRq3lPNTtMdj91zMZy6yt10s0NnCCBc
	z2YVH3rWtSM0gfR+0LNrhGNzxYXPh1nkWJyikBdSoI
X-Gm-Gg: AYBFou3Te591F9wnXmAeH6kOP5NBFxuN8s5m4ktHf+f6Z/x8lJxlES9Nm+izZwMi7lv
	XTJaLt3OaEPO1AboMZ0fDHNfyf8q82WjHtzf30oiSYHEgtm5oDUZwAcw32kLtGJNKlMZ6deWo8h
	tTDLBj/5UcWxuMYwnptIK1jdeMISWB9+2zuKCckrHMj/o51N2tXzlzMSxbeclPZw8bukzJFtLBr
	W1zxxaP0DdbANXfPXcEvxXCU88lXcwqzdiskZP6AlGJbJtirD9SwgC0MvKE5xVoSrzfL0UpC6Y=
X-Received: by 2002:a05:6122:4d01:b0:5c2:b01f:e503 with SMTP id 71dfb90a1353d-5c9f15bb2a3mr57794e0c.7.1790094870745;
        Tue, 22 Sep 2026 09:34:30 -0700 (PDT)
X-Received: by 2002:a05:6122:4d01:b0:5c2:b01f:e503 with SMTP id
 71dfb90a1353d-5c9f15bb2a3mr57708e0c.7.1790094870278; Tue, 22 Sep 2026
 09:34:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917163744.191748-1-djeffery@redhat.com>
In-Reply-To: <20260917163744.191748-1-djeffery@redhat.com>
From: David Jeffery <djeffery@redhat.com>
Date: Tue, 22 Sep 2026 12:34:19 -0400
X-Gm-Features: AclHuK_gOIIAGH-J9mfA_6kGZQPoZd_UXxbRIgUMsQf82GPy6D8kJfhp32jIMog
Message-ID: <CA+-xHTE65H=WSU4kavq7dC=FkaMVKuEZiNw5-o5DekRpgRkDeA@mail.gmail.com>
Subject: Re: [PATCH v22 0/9] shut down devices asynchronously
To: driver-core@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-scsi@vger.kernel.org, Tarun Sahu <tarunsahu@google.com>, 
	Stuart Hayes <stuart.w.hayes@gmail.com>, Laurence Oberman <loberman@redhat.com>, 
	Bjorn Helgaas <helgaas@kernel.org>, kexec@lists.infradead.org, 
	Ewan Milne <emilne@redhat.com>, John Meneghini <jmeneghi@redhat.com>, 
	"Lombardi, Maurizio" <mlombard@redhat.com>, Bart Van Assche <bvanassche@acm.org>, 
	John Garry <john.g.garry@oracle.com>, Jeremy Allison <jallison@ciq.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, Pasha Tatashin <tatashin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 12:37=E2=80=AFPM David Jeffery <djeffery@redhat.com=
> wrote:
>
> These patches are rebased against the driver-core tree's driver-core-next
> branch and should also apply against recent linux-next. Changes for v18 a=
re
> contained in patch 3.
>
> This patchset allows the kernel to shutdown devices asynchronously and
> unrelated async devices to be shut down in parallel to each other.
>
> Only devices which explicitly enable it are shut down asynchronously. The
> default is for a device to be shut down from the synchronous shutdown loo=
p.
>
> This can dramatically reduce system shutdown/reboot time on systems that
> have multiple devices that take many seconds to shut down (like certain
> NVMe drives). On one system tested, the shutdown time went from 11 minute=
s
> without this patch to 55 seconds with the patch. And on another system fr=
om
> 80 seconds to 11.
>
> And thank you to everyone who has spent some of their valuable time
> providing reviews, suggestions, criticisms, or tests on the various
> iterations of this patchset.
>
> Changes from V21:
> - Check a device is alive before accessing its bus pointer
>

And this has resolved Sashiko's last complaint. Sashiko found no
issues with the v22 patchset.

David Jeffery

