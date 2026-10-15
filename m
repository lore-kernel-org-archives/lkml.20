Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E5754A7CD
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792084569; cv=pass; b=BanjVyVv0K2Yg49SoYkMQntHfj231AP6E7/l1KlqB5CN0wIoJ8stKlJOKAR9GFRJrx3IPBLGQgu9zTJQakbMChdTNSgE1Q+RmkX23eJVyLUdfOc+KqUZ2KcuNkb9JckQGVBzxOpn38T5nDXV3m5BLKF5OH41a/jBCIvPFZBs7ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792084569; c=relaxed/simple;
	bh=HtdOozzHl5Z7pUX61SnkDUc9ufG3gbqOfQ5vzj23cVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IKt92o/GjDLedrF5DsTTLG5b0IZ79flkdLk7GOEG91egGYSdl90qWT5lyYCiltL/OX8vD13euHVAcnU5TPZaa5zIOVFT8ePNFZLAmFC9bNCceMhFMsc1+NNIl/LH+x4mFBWwjsVLQNt93Sg55eFyGJRNCMLAIh+JgyoMiG0c0mI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=Yek4SuzI; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="Yek4SuzI"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c315869241fso341379066b.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:15:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792084558; cv=none;
        d=google.com; s=arc-20260327;
        b=SZCeGnDQtWdjGN5iUYSSydsUWgDy0V1V8Luzoclqsgn1gXzHlvAqAMECbFTe+j+UQP
         aiiZO91N22XLqCQ2WrU8dLVpMwvH1UA7xvKEqCNOW8iFgu/lfe/d7M/0WZQMWblkEe1K
         inPr/S5OV/jgVfZ1TpxriZyT6KoTT669NU2YcbfYzcQ453ddi3EXqtbJboeSBjjFgdvJ
         2xfPpzD8Y+AyR0d1rBm+oXTGMTbSFHIrAmUkoBtzU2QsH2uQVhC6ffz8Xd7uw1V/6NZE
         9JMpl7QoCLURqjAS7oKdxEmloa8blokfH9jYq/u8DDg5vbF8o4vcQRtYBHahGBinZ2x6
         Joyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ew0YjksX9uYKVJLdU/3s4eNBwnZozDuzrVZ8OLd5tKw=;
        fh=6W+boM+H7jHbFRi0qf/bK9UTcuGTETlIt0D+ZHzS+yo=;
        b=HAN2z7YHoaEKcgjCKRXXh2ebz398lgANMTCIs2mUe4563osJSNXuwql+URPsp2w+In
         QoTSy7eEmNK/t66+78OhpZsKiaK7Qi3go4LUkGjC+HmaacEn2Q7q1tzAWJCPHI728l/Z
         pa0/zx8pGeqGnW6VW+8ZA3BDArn1ppRUL/9g4QwoWk9PAUIkK4AyDkuEGw3RSgAlWQAd
         e1bm9GPV+vnyQXaR51RpGZpAX3Gei5hIJyiokw2wrCPxN6s4+/zlEaaUSpgcgoWpjamF
         eesbC+GGaxAxEQjMM+wQgw/sR+Zkqi3pbioHUZm+8FZ+tcjN1GRPEh+5mqnSMe+XBoY5
         q0sA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1792084558; x=1792689358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ew0YjksX9uYKVJLdU/3s4eNBwnZozDuzrVZ8OLd5tKw=;
        b=Yek4SuzIG7FTQuyEBxyvVH9kQodG5MUtHT7h/+BWLc6ve+tdMY9VlsfBSPXS5KdIzf
         mcvjsDjljW2oevHOWh7cKQRdJ+dZkNEaUWJo9joRs8SzYY3WQeB6OsiccaY+koByj+Hn
         nJMwlga8c3UR2OuEobWZm56IqPjPhnqQqZ78cZ0jElny1kmd+INPxNSoUIKqms5MQlee
         XCrsi9josFejyb25LVjagfp7Xbd4VWVPsQMd3zCZJ2zMUY0cZWLWLLOBfYsSXKSQEaZp
         p6lDotkr9/svvq/EQZF8/lG0QYGkyhJFc/W04Ws1bNg5P5ZXVWZHgVcGzXL8+yl3F/sF
         DfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792084558; x=1792689358;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ew0YjksX9uYKVJLdU/3s4eNBwnZozDuzrVZ8OLd5tKw=;
        b=O77R0Ot0+EbOSfgnP1aKdQ3R+Xfi4S0OHuFDHB96e4CPkG0fpJF2dfVXhZ8b5g2atZ
         MGu4FhsZXwIuXv0VzErV9W/YvzCespD8Dx655JVNExtyJH7GtehCV55yh7794BKVOCXI
         awfJHq522vOVEKc8++QfktNBukvzcW/8O0Qq+aOcZPiKJQLOEQVFHCGekeyukPMGFiXs
         g98VL+okRZbiIVOnikNA+Tm3roltUzgyND32sOzSss/Swg/vVbZHF3y9/ktBbehrMQI5
         cL5E1E5p1U5BXQDL6VUd2gRsewXVxBNPlD7CnXUF9XjKNbzehmoIQWN3KPNMDfT1t9nM
         9HJQ==
X-Forwarded-Encrypted: i=1; AKwUvByYICsDMj7QSNudEYwg6YUfJ7DoWePkbnQLB/lwlOk5vassizVqwG9gwA7x3EuzCpkp4b3ftf9XglakOYU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWUSNASeSgl0ze/plncy0BOk9NxsLyCscd99cOCf6vJJT4z8eu
	Q7aC8hx2JBcZuYTfPOvOP84OMT7UYjEO4l72ZsYx9dEmIUHzZOAUaH/O2HAB4DBRw8IuLc0R7OI
	xRTKu8+x+OtWpj02jQS4OKYzvAKlAvscYsD6gmqWrlw==
X-Gm-Gg: AYBFou1EBkQT/Vjm0neqhL46tBAF+yu6QYOM9hy3PHpF38D9q9glyM+hUBhS9loytKk
	d0BDJcSlFQNawFoti0eKFxIzt/bw4sCCQJFRCgqAaYe6afFG4miBTPHBrxHP32LG5mHqpZYopND
	223t8j71SD8IzeUn5uvjy/+fPU/QScdnnoq3SIbOhF3rRBvEPOwUJSIiMlJMX1TDHr0on1uLx56
	5kKQav5OPLIvPuYGv7HmgIyjrcn+2LIfTvNCEifWRZze9fpTrQiotjGlUWhad2W5yYx+eFdFh+e
	8nHU119EFZWoAq5hgDHrmScsVrh9V5XQeDYVtPMxUMDWXMO+GQ84gN8EUqiQP/R53efTyKWa8ca
	1s/Es0BGtZvqq7vyLJkI=
X-Received: by 2002:a17:907:7296:b0:c2e:4f16:fbf with SMTP id
 a640c23a62f3a-c31a9f8af14mr1836004366b.31.1792084557587; Thu, 15 Oct 2026
 10:15:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904150304.49104-1-max.kellermann@ionos.com>
 <b8c135bf-927e-454e-8bca-cbdbae133d51@huawei.com> <CAKPOu+_Msno=mux+FUc-oV1-ywRFujJcnKS2HNv0sjtRVtUP3A@mail.gmail.com>
 <CAO8a2Sj2UbocxY+_MRdcH1TWht=UJT+ANWmzqLY9MQxZ0ujUpw@mail.gmail.com>
 <CAO8a2SiVWYSR6s=Z34QcfPVNVSLGk+YQQza4DDEt8_8+j37AHg@mail.gmail.com>
 <CAKPOu+9x_7WQmKhW==AmLoSzuPrUqeSV+JR69-TaovjEhuj6Ew@mail.gmail.com>
 <CAO8a2ShEjqyNA41ujmF5GfOM+YbJvXqCHKO9V++KBkJCXNOSUA@mail.gmail.com>
 <CAKPOu+_+oCzprewMeggY=32eEUt5ukTvhVMbEFGSh3Owa1zJhw@mail.gmail.com> <CAO8a2Sj-_hbqEc=z0jgWW1oP36obzWWPm6KhQEDFAUB4v_2kaA@mail.gmail.com>
In-Reply-To: <CAO8a2Sj-_hbqEc=z0jgWW1oP36obzWWPm6KhQEDFAUB4v_2kaA@mail.gmail.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Thu, 15 Oct 2026 19:15:46 +0200
X-Gm-Features: AclHuK_DVNQ1cCsgoRsOLGAioGI7muaBF4j-vbq4dIKwEKH2CugUVaCzVBezlsM
Message-ID: <CAKPOu+_7ep9K8UPXbLQVewUXGSGOUaq9CVSdzxrfE1zjjy-k0g@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] ceph: don't unregister an MDS session before
 removing its caps
To: Alex Markuze <amarkuze@redhat.com>
Cc: "chenyuxi (D)" <chenyuxi19@huawei.com>, ceph-devel@vger.kernel.org, idryomov@gmail.com, 
	linux-kernel@vger.kernel.org, xiubo.li@clyso.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 6:22=E2=80=AFPM Alex Markuze <amarkuze@redhat.com> =
wrote:
> Two context lines still call
>   doutc(), and testing calls boutc() there:
>     ceph_mdsc_open_export_target_session(): "to mds%d"
>     send_mds_reconnect(): "session %p state %s"
>   That logging change is already on testing.

You mean your new "BLOG" subsystem that I questioned, but you never
replied to my review?

This is one of the things I will revert in our kernel fork once we
jump to the next LTS. Everything about it feels wrong to me. I'm not
happy with where the Ceph kclient is heading.

>   Unfortunately, it's not scalable for me to rebase every patch sent
> to the mailing list, your cooperation is appreciated.

And it's not scalable for me to rebase every patch that gets delayed
by you until it doesn't apply cleanly anymore.

Really, this was only caused by you, and if you don't want that extra
work, don't ignore my patches, and don't merge conflicting patches 4
weeks later - it's that simple. And no, I won't "argue for any other
patches". Our kernel fork has all the patches we need, that's all that
counts for me. I have offered everything in the past, but most of it
wasn't accepted, so I stopped submitting a while ago (because upstream
lagged behind my work so much my patches weren't compatible anymore,
and I don't want to do extra work to maintain two branches).

In this case, it's really trivial. There isn't even a conflict. Just
some patch context changes. Apply my patches to a commit before your
BLOG merge, then "git rebase". There are a hundred other ways to
resolve this without editing anything manually.

--
Max Kellermann
Principal Architect
Hosting Technology

cm4all | Im Mediapark 6a | 50670 K=C3=B6ln | Germany
General information about the company can be found here:
https://www.cm4all.com/impressum
A member of the IONOS Group
