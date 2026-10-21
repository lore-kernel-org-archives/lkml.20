Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792575789;
	b=Et6gkc6ZP7nd/GdErPULIIl1DEYwtDenyZNJq15JY2LXpsG6hrWToY/ZSV0il8ROhb+g
	 oQzlhnyLD/h016k0zzx02bQpvW5cLcbFLYDL0xapSgLsrBzwjXuqkGF+eUo/MLPb+8smN
	 COUl2ld57EgiznCKldz6//DpwgdgFpdD4mPtkxAJU4wwYsJpVfEptbtfesKqchOTBhwRB
	 CUwNBExgrIOBu8NArNgZttubC3NzJiQoRmn6nzGEO1nWg0P4+PUol5/f7KnQnu2OoWw5b
	 HVnAl75WZuvCaqgy4QwghHO0LKNpBSeBcXTbSEfKdWRpGflcCDSWWRofep3KCFPcFKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MntThF0zJNx5wgWPLxaCNehOSFPp3KxM+IXJC9mIRCA=;
	b=oM6Vv1042H7xWu3LjeWCgDFUWKPJcHQbN+SEiMTaxeKiJnueX3hbkzoBy0v325yhYmpU
	 qFdLuHaFRTVew6K6j+qFjfPkUrp2T3Ztoqx20raY7KDi896xGGyyoVBsxxchDLT76n3vi
	 7itRYt4mZivS/GWBIuAu1/LQzNlHA7QgmhQPVg3vimldnItBLLDyF770zNK+dXFd2e+cY
	 36XI0O/PrWCFkNNHJlnvJESSQJi9ujXWdzfNLS6No82mKbTyfKM+s/SQ4HnOnSLx7mU3K
	 Si17RTkdIQvwKHU55EkvywoLMq86Rn30iw6y8BDufZL8CiS2CnaYpfs5NMC8AStChoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PJ8ddkta;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC524606A324
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC524606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PJ8ddkta
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so493030a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792575787; cv=none;
        d=google.com; s=arc-20260327;
        b=sBEL5xOeSQguAd2h9juYH3sKubStF2oKzulenMHr6tp0tyRBdwYUZ3BIbl4qlEU0wd
         /s4WL1kxvVcmWW1DounDnyVSwjlI2rQqMZmN2JS6RDyWoiRUahxkBOKpbyL4dlU5IZAS
         vMvPpYmoU8iP8TCOOLEkhYscuAbwK3KF/BxujPzsYx5VayUJzr/TlOktnbnsauJ36rBf
         93gv51BLyOTgf+fmxE6wfCaWdR6EH8dIsEIk4PCG1rJw4ZZtqkYjPDNXrKvlysy1pmiv
         HL8Q1THxn6K80vc6vAt8UcP/8U4HiVX16L1ahfNy68CpvOU/9tfUuFs9v1kDtqkIKZXp
         ffxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MntThF0zJNx5wgWPLxaCNehOSFPp3KxM+IXJC9mIRCA=;
        fh=wRosfZQmTJX8x05UKtqGfBFq642fuEi7Bld2hTj4L2M=;
        b=Ba8XivXPzGT8oGBOBlK4DrT7PI4Bsr7clmQVlWwnyfe1jQ3jAT1qU+o2uUHg+hiLqN
         QnMgT1MQwYpnUYrgUgsgogBWpFIjTTEAmCjgiXNRXnjrARGCZ6J3yFwujQgtg9zer842
         gvJdq86hg2rB3m5PNbvVkzJK2rjI2RIigsKAd4a5XxrfNpU1qbB6y6JfFnkrNUFn1k/9
         /X6a6gmj16Qvmrp8baVrloMQUldm+7ZgmoieEstoTcM+eL27K8VZAhAIBGRrOCY/szsP
         RsooNSTLYEb21Xl8jWmuWt1eSST3yqKjD+8l52RclZUKbHG9Xo8+60Ln8rYIN8cvfThs
         KpdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575787; x=1793180587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MntThF0zJNx5wgWPLxaCNehOSFPp3KxM+IXJC9mIRCA=;
        b=PJ8ddktaCSyWWEU3jtSe5xVszsvTQbd9IbFTmwN9RIehGPLt49IMb3BuUoz+UQgaRM
         1YzvdvkJuDTfTRR8LZX83RGoOdSepf/Pq2OTcd7i/in4WDOUyzJ7Uqhbw0TlcvYBU4XJ
         h6Z7I1KGNPikAVRHtXS2jc1MhLDMAcQLQlnmcz4Dl1GdSJ6yfeyPwL4t/y4LE90AVrVg
         g4oY9AjCPKhHii1LnyHksMGt2GpUEhsyk+nCUsol0AigM35EH3wNouQd9GiPVhBHBLoA
         NrbUUuXWUZWLxPel1TyEKrkhSCwKhkJbhmE1tx/axei87Immv1xTzxDorFmiSH4OBhSX
         Y6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575787; x=1793180587;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MntThF0zJNx5wgWPLxaCNehOSFPp3KxM+IXJC9mIRCA=;
        b=bYOIAGJKu1tvW78u2KCvEsmzqa/Wz6BLnVQ0mwUVkCmYIPyDcvw719UiVoMNxiOUU3
         AyDGmRhg/aNE/L+hZ/yl8h4QXPC/l6qSYdhB5ok5QRe8qZrKwkG4QS38fJCNZyDVKr2x
         QUbJRgANevdm8hKHlk3C0cEPmNw2URbYaheFuo86lnD8kIJRWi6LvGC4P9h+v5E5PQPz
         urTXjVJ2XwSdR0ThNT/5d8odKX+MP8uymkLSiS82DKr6za3asaGzMWCoLrK3ldsA3weS
         yfjCCn4vryQKTtTnf5thMTme+HzMEjaMldq5yFzuga6qElnYiesv1WX0xMdCBQlgwgfs
         1NaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwErMYjPSKbEqgX7Lyl2/DqnYmkJLlyWH2tU0W15WdCeA9JbIIXZPjXoLRnz3eq5PSlb5ZZ7qFepJTNgwE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRdQbMLkgC/KqltHn5z5vHT4hLI0mt60ZbJu/oSMp4x01AsZ41
	XX2nE3aW+gZHjxfrv0a2BHr+fdcDX9lutmEuvNaRqhXJF6u3f/tQXOsLtJ9Zdsq2m6A6+lhSO1E
	FYbyQz0YJg0EMSqWjuKGzJ9A2jvNQvXVnTIX2
X-Gm-Gg: AYBFou0j15mvEymvI25TetfyYFMpqVv2SD5whbHFipiYTwAyIbeWurSLi4QL8aJ0CLQ
	fRZ5emzC1v5Fz3Cq/0NIBi6MvKSAf4ofnA6pbazfSSsExGymGOiuDO2qU/LlI39aGphfdRm/WOS
	8dmlkqv8tGsYSyAbdDcZ8Jqzy9GcDqHL5cIMWTvIS56DtbCbp/obgpbFMEwYn56wmun8uvQhp4G
	dLqKMuXLTtYunMw99HDIK42zmk2x86TpdkeQCav3lo566YZh9iwj+GuO1SAsueTmdxPlq4PL5mO
	mitue+6l+dPZl+cd9t7OW5FTrsXj89uE29GvBmKqq+Grs6wtZWgbtarsfmLljmF2Wono7sl0tIm
	RAYjBirOrZj5cG3EFVx04OpKCZzvc58AHpjAa
X-Received: by 2002:a17:907:c499:b0:c41:f29:72b1 with SMTP id
 a640c23a62f3a-c4679b52fb4mr128636066b.47.1792575786748; Wed, 21 Oct 2026
 02:43:06 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261010094000.2036805-1-friendy.su@sony.com> <asqsNhtlXaEOrEky@XiangdeMacBook-Pro.local>
 <TY0PR04MB6191A63F6B79E4109D185F41FD9F2@TY0PR04MB6191.apcprd04.prod.outlook.com>
 <athyOw_WoXy9-NDR@MacBookPro> <TY0PR04MB619129E92AA946EDDB179AC1FD662@TY0PR04MB6191.apcprd04.prod.outlook.com>
In-Reply-To: <TY0PR04MB619129E92AA946EDDB179AC1FD662@TY0PR04MB6191.apcprd04.prod.outlook.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 21 Oct 2026 11:42:54 +0200
X-Gm-Features: AclHuK86ptQxjZGSQZAMWjUka8c9G1xaaTLy_CNP4cKT7z-xfVp4iAf5A8vRYgY
Message-ID: <CAOQ4uxjWf2A57sKvGtLU9A1AAjtPD2fvk9GXKXLX_b98NYZZPw@mail.gmail.com>
Subject: Re: [PATCH v1] erofs: enable SB_I_ALLOW_HSM to support fanotify pre
 access event
To: "Friendy.Su@sony.com" <Friendy.Su@sony.com>
Cc: Gao Xiang <xiang@kernel.org>, "chao@kernel.org" <chao@kernel.org>, 
	"linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"Yuezhang.Mo@sony.com" <Yuezhang.Mo@sony.com>, "Daniel.Palmer@sony.com" <Daniel.Palmer@sony.com>, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 11:43=E2=80=AFAM Friendy.Su@sony.com
<Friendy.Su@sony.com> wrote:
>
> Thanks for your comment.
>
> I will send patch v2.
>
> ________________________________________
> From: Gao Xiang <xiang@kernel.org>
> Sent: Wednesday, October 21, 2026 16:05
> To: Su, Friendy
> Cc: Gao Xiang; chao@kernel.org; linux-erofs@lists.ozlabs.org; linux-kerne=
l@vger.kernel.org; Mo, Yuezhang; Palmer, Daniel (SGC); Amir Goldstein; Jan =
Kara
> Subject: Re: [PATCH v1] erofs: enable SB_I_ALLOW_HSM to support fanotify =
pre access event
>
> (+cc Amir, Jan) On Wed, Oct 21, 2026 at 07:=E2=80=8A18:=E2=80=8A06AM +000=
0, Friendy.=E2=80=8ASu@=E2=80=8Asony.=E2=80=8Acom wrote: > Hi Gao, > > Sorr=
y for late reply. > > We have considered fanotify in erofs-utils. I think i=
t must be used with > file-backend mount. It
>
>
> (+cc Amir, Jan)
>
> On Wed, Oct 21, 2026 at 07:18:06AM +0000, Friendy.Su@sony.com wrote:
> > Hi Gao,
> >
> > Sorry for late reply.
> >
> > We have considered fanotify in erofs-utils. I think it must be used wit=
h
> > file-backend mount. It actually utilizes FAN_PRE_ACCESS on ext4 or xfs.
> > Also file-backend mount can not support DAX mount.
> >
> > But for our case, file-backend mount can not be used. Firstly, there is=
 no
> > ext4 or xfs file system in actual environment to put a sparse erofs ima=
ge
> > file. We have to mount a normal block device. Secondly, mount must be D=
AX.
> >
> > The basic flow is file content is fetched from remote then filled into
> > local erofs file on the DAX mounted block device in FAN_PRE_ACCESS hand=
ler.
> >
> > "/dev/loop0" is just an example, not our actual use case. The actual bl=
ock
> > device is something like /dev/pmem0.
> >
> > In order to make SB_I_ALLOW_HSM only set under block device backend,
> > we can do like this:
> >
> > if (!erofs_is_fileio_mode(sbi)) {
> >         /*
> >          * Allow HSM to support fanotify pre access event
> >          */
>
> nit: single line /* Allow HSM to support fanotify pre access event */
>      according to EROFS code style.
>
> >         sb->s_iflags |=3D SB_I_ALLOW_HSM;
> > }
>
> I am fine with that as long as you limits SB_I_ALLOW_HSM **only if**
> s_bdev is valid (IOWs, I hope we don't need to bother it with EROFS
> SB_I_ALLOW_HSM + file-backed mounts; it aligns with other filesystems).
>
> Also I think it would be better to add a testcase to check the basic
> EROFS SB_I_ALLOW_HSM functionality in erofs-utils (see
> experimental-tests). You don't need to add support for EROFS
> SB_I_ALLOW_HSM directly in erofs-utils; but a basic functionality
> testcase for this is needed.
>
>
> BTW, for your use cases:
>
> > mount must be DAX.
>
> As for virtio-pmem, why not just use userfaultfd on the host for
> virtio-pmem lazy pulling? for example,
> https://urldefense.com/v3/__https://github.com/firecracker-microvm/firecr=
acker/issues/5740__;!!O7_YSHcmd9jp3hj_4dEAcyQ!1I4HPp-ti8SbtdVUzxl0B0QuNCpDM=
YyUh1CGGxNZEvFSg_lZnXaDitDh6Clg2me7wzbPbUl2X5E_vw$
>
> Personally I still don't think monitoring FAN_PRE_ACCESS of EROFS for
> this kind of usage is a good idea.

Personally I agree that this is odd, but practically, this allows getting
FAN_PRE_ACCESS events with extra range info on erofs file's access.

I don't see the risk in allowing that so I have no reason to object.

Thanks,
Amir.
