Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F90346777
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 11:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791719645; cv=none; b=KvW2mMIOWR1vHiLHuRcwSUc4fTea65aBtVSHrDK8F6rxpjxoj8yGZTYZ+mfTfQhhamNG2mznkYAs0Ukor4LsW97QwXnEhN95MLgvlXBFKD0rYUz0PyowpUko4rKiVG1V1WvoicCWFVja745S2jVhzuCDVLf6R3eW/RwFb+v3xzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791719645; c=relaxed/simple;
	bh=y5R9O8/j2JBBQLjoSzmSbdWsy2dCepPFXvVZk1t7wl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y0Wp3Ct+4RAHJovtbnLGeN+463gWYsehKEDZXmTTJs2SUpD9LJVQrj3NNxhXoc2mBZV1LZ7q1WJYGkrnjBDoGgiRLg4ww/RrRpSVmU7zUGXyeRdfmHg9S/BVqi8JCBhmCTvQZICy4hMSrSEQGkhYOie1IrXzlNEBPQjhTtu/PRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b=NPgAVqlF; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b="NPgAVqlF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tP9Ock7YEMVFTnRWgynRTIWH8Z1OWVvG889g72gXvsY=; t=1791719644; x=1792583644; 
	b=NPgAVqlFc2umwC3zPr9cLKsxwV7dt+ZTC+kZiMCHZC7ckOaGf1HnUy+nL6Ic3U8Omhhgt185Sn3
	QLdL4f04b6yvPK6hSRpNxi9Tc7dgii1hd99Zl0BeXKEHn5SYnUtigVQQYZrAOZW5jGcnlDEGcMUHC
	/AZKyxv292TZL597W32xu8b1SR/pX4T+jAKKGVJHMfjdzFqzvEW4zrGWmxGiCXU9PdfC7a4Ep3WFN
	gcuuoYXr6RECgsE0QtlgDPkoGPZyCBEn/VMgWNK/NbsCKxvylfY2c9jmByOmeNTATUP6WstutF89a
	+Y+RNcdw5CAgMCK/7ReQiHGFtvl7nBNq7pMA==;
Received: from mail-dl1-f53.google.com ([74.125.82.53])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xFs7v-00A4aq-7b
	for linux-kernel@vger.kernel.org;
	Sun, 11 Oct 2026 07:54:03 -0400
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-141395927feso1879522c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 04:54:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy9Rx73ppJiy/GugM2IVzOHHt9sV48lpxEscrOEyRZg9vKpS6jY4KdSXfbCPJWcMG6eP0C/KHPpKPo+Lk0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcH/2NG1++FLN/zogTnlan/Vdxo99N9QTyXi/KzoepS2GWbYXa
	dd4sqqOECMIcgTqYsVpLamSwq0GfXFsU/2NKosEb3p0OI+oKRKD3JwG1geHvitjIrkUyPaIDOVl
	WlB30PAcZJ4N5JRpDDb4fDRZhoFNkP9k=
X-Received: by 2002:a05:701b:4211:10b0:14a:a6dc:9cd7 with SMTP id
 a92af1059eb24-16a57a16ef2mr9484052c88.2.1791719642208; Sun, 11 Oct 2026
 04:54:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010181016.44f5e2883b6820bb32c04204@linux-foundation.org>
 <20261011012245.765558-1-nickolai@csail.mit.edu> <20261010211804.2d8a5f6180c74b08e18ad48a@linux-foundation.org>
In-Reply-To: <20261010211804.2d8a5f6180c74b08e18ad48a@linux-foundation.org>
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
Date: Sun, 11 Oct 2026 07:53:50 -0400
X-Gmail-Original-Message-ID: <CADGQE7GzpGyTYKznykdN++Swo=Gwx7hGfoWxY-BOqHhx5reJ5g@mail.gmail.com>
X-Gm-Features: AclHuK--8xB7R6c--WfyPx9s5OXlga2T92h3ZOhe-bcyVaefvPE4WrRAKnsZPzg
Message-ID: <CADGQE7GzpGyTYKznykdN++Swo=Gwx7hGfoWxY-BOqHhx5reJ5g@mail.gmail.com>
Subject: Re: [PATCH] lib/plist: add a plist_test case for plist_requeue() on
 the last priority bucket
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Adam Harshbarger <handyhandyman.adam@gmail.com>, I Hsin Cheng <richard120310@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 12:18=E2=80=AFAM Andrew Morton
<akpm@linux-foundation.org> wrote:
> On Sat, 10 Oct 2026 21:22:33 -0400 Nickolai Zeldovich <nickolai@csail.mit=
.edu> wrote:
> >  Not booted.
>
> err, it should be,  If this is wrong, we crash every kernel at boot.
>
> > +     BUG_ON(plist_last(&test_head) !=3D test_node + 1);
>
> No, let's not add a BUG_ON for some selftest.  Emit a loud warning and
> proceed.  If it triggers, someone will report it.

Fixed, boot-tested, and re-sent as a v2 patch; thanks for the feedback!

Nickolai.
