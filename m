Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66B24AA58E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790272780; cv=none; b=tRFDM2au6YiR1xkEvM3DmkqGNePwkXjs7XsbhuoRMbJqAu1V2Thi7K3F/b5m9KmieAtkDPp2stEG/UnFPozA7hCngp1LiLe4QiZbriStQpzvLVMmO21C3DEY0ZFbxDS/IvHgYPhMk7YaAh+le1ukK8qGS371MzGk4stUsxr0Xdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790272780; c=relaxed/simple;
	bh=fF74laipFT1G5TeJZYe/ceejQjOAN0pdO5e1WUdrC+4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eauhbIEK0gOCcPvBTRRsQqkh1qClXXBAk2Xk4HzVJ1R/BrTiJP7sUWFOHHL8uOl3lIql33Ug0WiheniF06Jo9jhZb5eTnrCK7tea9PaDbqufemx/+r6YdecOa1Lr4AspjaL0X1lGA1Zcjp+CAxejQRJiObFu3Lf43uD4WmEoY7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZlI1WnEz; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZlI1WnEz"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so76879f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790272777; x=1790877577; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fF74laipFT1G5TeJZYe/ceejQjOAN0pdO5e1WUdrC+4=;
        b=ZlI1WnEzdSYptk+mAVhQZISGuKovacqzAeRQqKIYSOT1UjuAVULZWWI7sPLZY38POK
         /GfDnUHRJi5+ioySuM4JkAXnAufphvQRp+ztdMxfwmOgkRf552Tk6ASON8ch7jHfGynC
         xPSuvx1s6LqPQkMNWkTe1rLzt1zilFeM1IRGHE+a8pmcN4/zNex3RgGjXG7lV+8jy0oI
         003SS8s67pgPPTUkmUFN7zpOKBC8RatHAS4OH5hrNEFn/hc4UF4N7lx5WR5iKIyp1HUE
         voke+yTt7QmPDLl49gPOvZOJOQwnwSTZOikO5ddQ3cKVL7I3lxYKTPiTlNOlZd1JzbNE
         yW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790272777; x=1790877577;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fF74laipFT1G5TeJZYe/ceejQjOAN0pdO5e1WUdrC+4=;
        b=RDTK1NJ4whfs3UumusmkSlmqYHjbH+hIpeDcEff7vyI7pRApK9WsPkXWhJOZCKrY4Z
         CM9klrhokwhvshZEZoB8eYaAw00np74GPVMrN7KvaQzFkekjk1jK4vTMXoIOrzn/ZYj6
         T3wHVwVk54G7XuREUMELhoplzZVhQSUnC2vJcEh7Xb+pRpCna/NpE819hPztmUl6mXJb
         Gt7mJr9OSNtWk/rtBKufgA98oobTW1vKYiheq7LUwpBvO2/FBg24wbXrv5vsMvUXKDVD
         R3djttLt3SrNqe53zhg1jw3t+AI3lA5x0zr3uvXZ8WowyndRSdk6H3T989SfJXN6ga4P
         X03w==
X-Forwarded-Encrypted: i=1; AKwUvByXgs/KB7Fs/oaCTFS3yZiULlQaWRSt3CuuDDWsWuwuXGVO1gILrPS1JbOcQ2ZPISG4XrhNmjEbVaB7ZbM=@vger.kernel.org
X-Gm-Message-State: AFuF++krpJLzapi7m2PaX8VGGdbeoBaItvysNpEL+H8PAPm+Wn3iMuHt
	KvmN05s1DSP1Iz28w/SpIVrx+LNSLyZH1p9KFY7Gw73Nnd9Ouy/nYOgHD2quT3LeLm6m6VwXepl
	1pjPOcDY=
X-Gm-Gg: AYBFou0Qavr/uEzGYfPiE4Fr4mBCh2ncaD78TCh9D+8kRz5yktklo4EkCmAEf5KyrGW
	XTh5VmzZw6ez+exTHjZOOcYToq9FhZzlZ4E0dztS+lz5cKFguC00IP/YuwqsvTIcK6xjG7rcJ5f
	Vpx+SfW9jvDyHXa6Xo2hJDeimqShhc1qfVqpJDxL7weLDGwlgH4Z1SVk2twfxOr1IuaUorHizj1
	gOdNXqRQgCXk0PzUQWN1lLd3zoNNMwRRJtPuiBQd7io0uJjhJ6cKtsMa07lgID4OYWbNwg8y48D
	XCXiXm3Vbk3HHDpQGI3hZePD0oOLzvhMF7hZQRP7R026VVz8n7NXZRJtY1Em92Q/pS8UplJZhEc
	5cv7/w+XYbdMB8iJhKUFUx5CyEBSEDLA226qUxhAQs3TVtZESqwlgpK0xXvITyCHJBsA52HzfPg
	TAZbKLolwKWWhFOe6O8bKFvoMvx/2iIf8kq4G8BGUl3JSWShjUV+kG6iKTfzy6bgFzwp9dQTvFV
	BgFlhhLqucN7VB2gAwMHiQQ1oQ4pQSOgszyl7YueWXGnPpvW6Nvks4KK0SFKJ6DYP8PeC4VoTA9
	lSbzR2mGMTUynogRPzSvN87ClYtLWmtYoy6i/f76wB7D
X-Received: by 2002:a5d:5f07:0:b0:485:8c16:5ef6 with SMTP id ffacd0b85a97d-48871874b3cmr6229087f8f.48.1790272776686;
        Thu, 24 Sep 2026 10:59:36 -0700 (PDT)
Received: from p200300de37172700e7f885d729fa4be7.dip0.t-ipconnect.de (p200300de37172700e7f885d729fa4be7.dip0.t-ipconnect.de. [2003:de:3717:2700:e7f8:85d7:29fa:4be7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a640df9sm668299f8f.24.2026.09.24.10.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:59:36 -0700 (PDT)
Message-ID: <c1ba66d1bb5c498197559749842b5b470c06f4f2.camel@suse.com>
Subject: Re: [PATCH v6 1/2] md: Don't set MD_BROKEN for RAID1 and RAID10
 when using FailFast
From: Martin Wilck <martin.wilck@suse.com>
To: Kenta Akagi <k@mgml.me>, xiao@kernel.org, magiclinan@didiglobal.com
Cc: linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org,
 song@kernel.org, 	yukuai@fnnas.com, shli@fb.com, mtkaczyk@kernel.org
Date: Thu, 24 Sep 2026 19:59:35 +0200
In-Reply-To: <010601a0d43e61ad-9dfd0eee-a057-45eb-b5cd-dfe9d892d4cf-000000@ap-northeast-1.amazonses.com>
References: 
	<010601a0d43e61ad-9dfd0eee-a057-45eb-b5cd-dfe9d892d4cf-000000@ap-northeast-1.amazonses.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-09-24 at 16:27 +0000, Kenta Akagi wrote:
>=20
>=20
> On 2026/09/23 17:29, Martin Wilck wrote:
> > Hi Kenta,
> >=20
> > On Wed, 2026-09-23 at 04:08 +0000, Kenta Akagi wrote:
> > >=20
> > >=20
> > > Hi Martin,
> > >=20
> > > I have not given up on it, but I have not managed to post v7 yet.
> > > I still think failfast should be usable even in setups like that.
> > >=20
> > > It has been a while, but I intend to resume work on it.
> >=20
> > My thinking is that, in the fastfail case, code to prevent total
> > failure could be placed in the end-IO code code path, e.g. by
> > attempting a retry directly from the md layer when the last rdev
> > fails,
> > instead of setting failing the device. But I haven't thought it
> > through.
>=20
> Hi Martin,
>=20
> I may be misunderstanding your suggestion, but Neil's original
> failfast=20
> implementation already retries a failed failfast I/O to the last
> rdev.=20
> But a later change introduced a regression, which I intend to fix.

Ah OK, I wasn't aware of that.

> So the sequence should be:
>=20
> 1. The failfast bios to all mirrored rdevs fail.
> 2. The first rdev is marked faulty because its bio failed.
> 3. The other rdev is now the last, so it is not marked faulty.
> 4. Since the last rdev remains usable, its bio error handler=20
> =C2=A0=C2=A0 retries the I/O without failfast.

Yes, that makes sense to me.

Martin

--=20
Dr. Martin Wilck <mwilck@suse.com>
SUSE Software Solutions Germany GmbH, Frankenstr. 146, 90461 N=C3=BCrnberg,
Germany
Gesch=C3=A4ftsf=C3=BChrer: Stefan Gaiser, Jochen Jaser, Abhinav Puri (HRB
36809,AG N=C3=BCrnberg)
