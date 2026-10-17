Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548A21925BC
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792212634; cv=pass; b=rdtC4FrOwxyTT+0bXDEbPjkZSoKI3NhZg4z0Y0V2C3i0AyJ14TuTUhe0+HSrWAP8Pc9RMd2zK2TT2sbQ4ugN9n8Xwc7HlIxUSCwE8T5BGVWRIh+oAL+pcQ6gQ/ZnISz+5aNedOqcumqXIUl8DhLZ6N4fLLMBDbNWmgz5tQkc3Wc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792212634; c=relaxed/simple;
	bh=K1yiiGLtdLJanbf2XaVdwTehw3IIcK166DQDerPHjQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RJ52RL0iCBkv4Dp8Uw8u38coMgDRoWmYdjgnq/ujMF2emVC/aecdFo2PLMEpukH54EXrFx+it3+L/VBk/iK3wgkJhJXKM5eqnLxMgYQ+2rPTwLgsHD9Z22d7VWRq/ZYa9Hwffrk/vqbbK8R2pbnHKqmFwatgxxaPipb5/89e3mU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghQoZlj2; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghQoZlj2"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48de6a62a4cso341427f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:50:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792212631; cv=none;
        d=google.com; s=arc-20260327;
        b=X2GIbYffAFt8gito/5/AwHGfrPTD0G4ia9/p6CpfuOxQGC5Jgpb0e93l/vxGXi1QWZ
         ND0L9cjSttJlmcinxY4b1qXUalz2YaZaX+sc7dL1S2rxyodishsU4opxwT3BeJwy6Stc
         YVsJvX6LYQr6tiqHxwKhvO4uzcXOcFGdpbaGcupTPr3wRB0joh9NtP2aqGBdQ/4QZQtj
         rGRapYh8XR9bbAo3p+GoKYIB4uSxlSh3s4DN0x0bqi4DAej8IDsvyTUGnp2Mr/E6f6ID
         dVisBVnqjMrHP3aeUVZ/iuwOrpq81r3CaR4Qrs6M9r0PAVT1X6xSevJggPQzjHcPWT/+
         VZIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qosHYQJuZ24ikJeviUiwQ2yNV+e3zKJeglG60Rp1giM=;
        fh=NlmKVrcNr3LX9INOC9E0HL5UiIJXDBlip1OtSiLVmIo=;
        b=ffrfvtnF/4UedIMyvJuTXGPXdTGrTezBrTulrj8zaMck7+STaP/L45HeT3EyEbRyvP
         1EyYSgtuLogrN8HeMk5KpB6pILYYQ4Dh/6LejiJXF2LJUn1iYACJpNRjsdNgczCUUWuM
         TBQcqJsJFSqhTZb+zj2x70IsF0bgYJU9r9Mds1IGjWxPWgkL82WixOauL2ojV+oSRrRj
         6MUIOroXiLuhk6M8iWmKy67ZcgQelskn/zkbLoXjwgob/VTtVPvtFBbt34im/AmuaRSl
         TjJPFXIukzgjkvBQPtJUoKWee6DcfEDs773lM0ltskqeFnRTDO+V/ymse+deraa7lI9d
         4pfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792212631; x=1792817431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qosHYQJuZ24ikJeviUiwQ2yNV+e3zKJeglG60Rp1giM=;
        b=ghQoZlj2FBPCwUlgRWNYWkSdfHzoHX33oWsrIq9c3hnVdkbaR2hxGfBjrgm8K68KYb
         vn2+5HsR9u8SSe8Djdr0Hzr3wsdWHjPR3Ui6a+gugVjZpPb5CmyykGt7YbPcPUCLIFfW
         fan1wtWPL+C8WJdwELS4vtXMKC4geITASLCWDMH6Mm2AEUHkct75VROfCx3ZAl1Njvbd
         6YQfOscuBXykA2Ykx0tieDLp/ihVrwPoYGX1WQb765ogGeETKxrcP4QzfsFvk577mRx9
         Dfgt507m/6ikpc8sx9AWjJQFtiXxNv5t28s32H5ZSM8ZA+dLXsuy2PBfZMCnfSlwu3yG
         myig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792212631; x=1792817431;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qosHYQJuZ24ikJeviUiwQ2yNV+e3zKJeglG60Rp1giM=;
        b=O3zHNHzxdk6vm4ijnhb97tLcWSjJpOdN9nTX5gEmEP0JIbv5kin4V/5W1WE8JwlvMd
         H0RPlzRpE8wbRn3quj+E4FXOuMXB8QLACoVJ8gtYz9CaWLqVmdojSYk40HEfzn+GaCxF
         0QlW1UBqBBufqu8vkUCJ2nzb1TRlhfOt9t5vLLfDs4alH2x/8D61SNWsm/IfB1h5adY5
         zvvhV1X7ekBBLq+Pg0QT4B/0wkxhMYhPMu/JRAwUmuUYRP1PEw8jtSU7fwV2Rh8eLHqA
         5U79QKGjN2+7yq1+IlfcP36cqbpqg4Hq+/vZ1pQ+9/FIQXf53FGkTH+83df2UUEaUd2n
         k4tQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcaAEB9aX1OAl0OjHtLPfr7DFxRHyZWoi8H/lWQXUdCHy3eXVFi75rsZxqQ3KEfOZwB7BzxMTgDVS8d7g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLunAAI4n2e8PNvfBGAID2M9FMFKH1aRqxYWjB8xp5WaYELfvBW
	IDFFi6rPNEPHR5dAgAdtk5QIzbZGQ/tUvWwMovmin+Wh34gNXzbVYksRSExchE6qqRsbKu0CVPv
	XMHSCouP5E/AMVWS+UDK6O7lqB95Ga/Q=
X-Gm-Gg: AYBFou1TnLCWbCP3IAIvrGgLp3xSRejQN3i1bqZjpHykA/bDGvcYVND9fS825s3CGEi
	z0xYxMpOQhaBX6vOu/5I8wZP6K2VloSUrsOdzoR3UCm9fDxeMMSvla97d3/ByRq5VL83kK5apx0
	nf0j4zd+CwlW+jic6UnGMIMvlN873aygP6k82qS7dGpJD5VxvuP6evxr+9YJCi6ec55W7/Qt7HQ
	jf2PsXXcNnVQkO7S/8okyB1hk2O67ZXGJMmmGcJm/K86z4elIAEUP6p17++IftqRRXJhaIK506O
	d6B0sxYXmsSEZ/RgpFFkQP2ezo71vzTfGyqRojnOIvg4WR8GTWxyDFb1fq730TSUobkernzStlE
	mGygaxic2DpoF2C+MXoTo1wz0jIZ15MDzXC53dA==
X-Received: by 2002:a05:6000:2dc8:b0:48d:f1b3:c02e with SMTP id
 ffacd0b85a97d-48e07bbcf38mr3052492f8f.25.1792212631160; Fri, 16 Oct 2026
 21:50:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6acbc835.a150a118.27e199.003c.GAE@google.com> <20261017020912.558-1-hdanton@sina.com>
In-Reply-To: <20261017020912.558-1-hdanton@sina.com>
From: =?UTF-8?B?Tmjhuq10IEFuaCBOZ3V54buFbiBEdXk=?= <neganhat@gmail.com>
Date: Sat, 17 Oct 2026 11:50:18 +0700
X-Gm-Features: AclHuK-UvoVbSR_Pxubp1gYLuQGISCM05_Zi_2y7vlURmXgKlnjSKpfveIzg7Lc
Message-ID: <CAFJkwZxp2DnU=9748k=CjeANEL23Wn7zJ+wG44mJiiPL0ecJzQ@mail.gmail.com>
Subject: Re: [syzbot] [nvme?] BUG: corrupted list in nvmet_fc_remove_port
To: Hillf Danton <hdanton@sina.com>
Cc: syzbot <syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com>, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 9:09=E2=80=AFAM Hillf Danton <hdanton@sina.com> wro=
te:
>
> > Date: Sun, 11 Oct 2026 10:32:37 -0700 [thread overview]
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    a5ebb76233b7 Merge tag 'edac_urgent_for_v7.3_rc7' of gi=
t:/..
> > git tree:       upstream
> > console+strace: https://syzkaller.appspot.com/x/log.txt?x=3D1494923e580=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3Ddf4bbab1c21=
72b9f
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3Dc98b21427617a=
f7f547a
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D126a0f155=
80000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D166a0f15580=
000
>
> Test Nguyen's idea.
>
> #syz test
>
> --- x/drivers/nvme/target/fc.c
> +++ y/drivers/nvme/target/fc.c
> @@ -1319,12 +1319,13 @@ nvmet_fc_portentry_rebind_tgt(struct nvm
>
>         spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
>         list_for_each_entry(pe, &nvmet_fc_portentry_list, pe_list) {
> +               if (pe->tgtport)
> +                       continue;
>                 if (tgtport->fc_target_port.node_name =3D=3D pe->node_nam=
e &&
>                     tgtport->fc_target_port.port_name =3D=3D pe->port_nam=
e) {
>                         if (!nvmet_fc_tgtport_get(tgtport))
> -                               continue;
> +                               break;
>
> -                       WARN_ON(pe->tgtport);
>                         tgtport->pe =3D pe;
>                         pe->tgtport =3D tgtport;
>                         break;
> --

[Resending to list + CCs =E2=80=94 accidentally dropped them in my previous
reply, apologies]

You may need to recheck the commit you're testing
on because #syz test or #syz test: upstream master runs on the latest
commit of the repository. Something like #syz test: upstream [commit]
would let the bot test it on the specific commit the bug was
discovered in.

Best regards,
Nhat Anh
