Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7694F7CA6
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789679676; cv=none; b=P8JLKhKJ1Y6/cmx0K2FrzEgRnBFpmeI8vqFyvurgVlnASNBG2L45x5EA24vTN0D8FaErHgIt/4SQVSpL2vf1nN9TvqPv38aY2I5Xdgv+x1iguCWwTpSBcO8sev1ym2PwH01rmeT/w1szQMxFb4NlhhQr0u7dE33Kcegw6It/PEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789679676; c=relaxed/simple;
	bh=38jxd0wQcDwbVDumJ2B589A/WlIbq9+EZCtolWKlhvg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fC9d5dKXPV5YCV4ZObN3/zJFmwQS1snUSnAF96OXpH4/Hpbj8JDNVo5Rcj5H2yxvMLd0ei77jareQhvStst2TqBAGp+F0cD8sGddjdZX05wppU9N4uiZHrHHfNM6ksivyHxXUzWZ65MzmcePM6U5fxw1TrQ5UsEDtkh0GzTIWZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IbTpIJ/4; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=b3TlgDb0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IbTpIJ/4";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="b3TlgDb0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789679673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=38jxd0wQcDwbVDumJ2B589A/WlIbq9+EZCtolWKlhvg=;
	b=IbTpIJ/4KbPh43dybIPQcxsbBZGKwtp3GS62kOWgm9r2FHp6kNYCIn3cSM4X5+9k4taG9i
	BLnJhb6UgRpMSSnRliX3iZC14cu9YJYw2p4iH0ulUMYDB0mviToCAhhLmcPCNy0KYx0R0r
	4c4DfWC2C44O5CMIkbyHKEw/kXnFYGU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-6hc3HZIDOp6GqjaO7xcE8Q-1; Thu, 17 Sep 2026 17:14:32 -0400
X-MC-Unique: 6hc3HZIDOp6GqjaO7xcE8Q-1
X-Mimecast-MFC-AGG-ID: 6hc3HZIDOp6GqjaO7xcE8Q_1789679671
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91242b356cbso1951596d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789679671; x=1790284471; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=38jxd0wQcDwbVDumJ2B589A/WlIbq9+EZCtolWKlhvg=;
        b=b3TlgDb033US2y+euTuDekj5/KC1ilJroCHlIhGhO2cZl+qDj9OEDm+LxuMQVPTyZW
         N8hC2pmyneNTiaDeFl6oGAl8SkGqvA38+BDox4aew06VicOSVuk7jAZ7J4arRAwmapZ1
         R/cmQhbcfQlJPf9+NCk9K2RJaBro6tGlGr0LNh8o1zC4pcxW5vyOUQ2Fbks5LQcQPHRi
         +xMWjBA8cO38TlPboxj14rkXxqPavkMBb7Ak+qcqCkbnNuPy6UsRkZ+MggRfhhBjcnKA
         EEqHNo4OHddJ087QqCUWDv0vWL7rmnL5dsmCQ0YAUnrlkORg90RKJvBb/VmZbmiYs81E
         MnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789679671; x=1790284471;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38jxd0wQcDwbVDumJ2B589A/WlIbq9+EZCtolWKlhvg=;
        b=uqy5wWQvzVop/gyKmHh8xqyXfbowVREVmzbRCPR9mT8A9HpclODNuyyYIbyHjjFKpZ
         UWXdqVk9VQ/6LQGgTUYrQSceZr2wq8+dZpmWof2BeqhxdvRzm4fhxQW/ZOQs+eCDg2H8
         J2PfwqQ+Urj/CU6utg2tQi839NtpMeLuRxmKwPxawDP+91bXKYufl79su5XdvhyEbq2O
         pathmh4ftzeZV8NBfAkyzOQEhjY9i7ttH4VRNm5RDl6MNQWnO3lqokIhTS46EvIpei5n
         rJyl0AAZlIdZVFVJh6sSx5DNEFHNTFAk1nbmQIHHwTF/GfY4mFtpU/G0iqKqYyefWOeE
         aIqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTD5NBa/Br3g/j9DcRfNLShhgfpghlJQB836dv1lcmPHPVw/CDWKXDIA0+PGK9Ra68nvBmHDZZJbwigCs=@vger.kernel.org
X-Gm-Message-State: AFuF++nuZGrspnN4CXZmdXUfGqBeqewvjWSNAiCwZ4H/98ONlOAR6Tqc
	K18xW6GLRiOViQAJKmkKP1WoMW4pl/xTgQCv+vwTt8FSL/GrjYKs2ZqoFKczs3eYbEhA8tvdFg4
	xceuuEU83J/JwPqKJBCbfV1ONv31yQiiNVKog7vcmF9lt+3xBSIZh8KwviJp/1qwLN6Q8/8FIOg
	==
X-Gm-Gg: AYBFou2IFQtXVrLHPjzS3VAgzPrp9gjLICwR6IaNSVlyUVBDCpkahSS3Y599PlUAp5V
	wKNkBvB1C2cTi8kk/NP1nc33tLKDYNICRE3VUE2gS23L2FUh16jRGzKacO9jhOkrdl0x/RavrhN
	84id9dm/kf3VDelY0WuiNw4ZG8WceAPrb/15GJMr3EzVSyNjnOOT/gqxLagv6Q7sU4OR8NImYSB
	wpsQKkS62O1ctotfgGcTT6NiA13V/8svtSC/M8js1SiiisfSeQ0AhrV66SN5WVE6u1o6bxilaT2
	sOfqrAW5CAkpJwdq1o+nVTKPG/BcnySvvEG7ruC1VEsCUOGrrL05xBQZxSUeCLOR90WPbUjn
X-Received: by 2002:a05:6214:8087:b0:910:6407:4ccf with SMTP id 6a1803df08f44-91254b85e5dmr10163166d6.24.1789679671334;
        Thu, 17 Sep 2026 14:14:31 -0700 (PDT)
X-Received: by 2002:a05:6214:8087:b0:910:6407:4ccf with SMTP id 6a1803df08f44-91254b85e5dmr10162576d6.24.1789679670867;
        Thu, 17 Sep 2026 14:14:30 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252c5bef1sm7218696d6.9.2026.09.17.14.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:14:30 -0700 (PDT)
Message-ID: <1372e336906a9418352edcf552d899685fb9b1d5.camel@redhat.com>
Subject: Re: [PATCH 0/2] drm/nouveau/clk: fix RAM error handling and pstate
 desync in nvkm_pstate_prog
From: lyude@redhat.com
To: Francesco Magazzu <postadelmaga@gmail.com>, Danilo Krummrich
	 <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Karol Herbst <kherbst@redhat.com>
Date: Thu, 17 Sep 2026 17:14:29 -0400
In-Reply-To: <27293a63217c3261c42d011cef8cf31e3d43fefd.camel@redhat.com>
References: <20260727152821.128432-1-postadelmaga@gmail.com>
	 <27293a63217c3261c42d011cef8cf31e3d43fefd.camel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Well, I -would- have pushed it but then I quickly realized I reviewed
these patches in the wrong order, whoops :).

Just consider these reviewed, will push once the series this depends on
is all good to go

On Thu, 2026-09-17 at 16:51 -0400, lyude@redhat.com wrote:
> For the whole series:
>=20
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>=20
> Will push to drm-misc-fixes in just a moment
>=20
> On Mon, 2026-07-27 at 17:28 +0200, Francesco Magazzu wrote:
> > Follow-up to "[PATCH v2 0/4] drm/nouveau: fix list cursor use after
> > loop
> > in the clk pstate paths"
> > (20260712123616.1180830-1-postadelmaga@gmail.com).
> > Sashiko AI review flagged three pre-existing issues while reviewing
> > patch
> > 2/4 of that series; the third (clk->func->prog()'s error being
> > clobbered
> > by nvkm_volt_set_id() in nvkm_cstate_prog()) is already fixed by
> > patch 4/4
> > of that series. These two patches address the other two:
> >=20
> > =C2=A0 1. nvkm_pstate_prog() drops the RAM reclock error and falls
> > through
> > to
> > =C2=A0=C2=A0=C2=A0=C2=A0 core clock programming anyway.
> > =C2=A0 2. nvkm_pstate_prog() commits clk->pstate to the new state befor=
e
> > the
> > =C2=A0=C2=A0=C2=A0=C2=A0 hardware transition has actually succeeded.
> >=20
> > Francesco Magazzu (2):
> > =C2=A0 drm/nouveau/clk: don't ignore RAM clock programming errors in
> > =C2=A0=C2=A0=C2=A0 nvkm_pstate_prog
> > =C2=A0 drm/nouveau/clk: only update clk->pstate after hardware
> > programming
> > =C2=A0=C2=A0=C2=A0 succeeds
> >=20
> > =C2=A0nvkm/subdev/clk/base.c | 9 +++++++--
> > =C2=A01 file changed, 7 insertions(+), 2 deletions(-)

