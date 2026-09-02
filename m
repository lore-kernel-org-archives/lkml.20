Received: from mta0.migadu.com (out-213.mta0.migadu.com [91.218.175.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F02D4A92FE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363802; cv=none; b=hHSYEmATr3j/LlXU0CeZgwiWE6LH9m9FG439CjPFX0gXI7NbyivTLR0TOf5WeBC/VNg/pZd/D34nllVPAw+cEdVqgbRL6IuRerf+b0d++YDrFiUDZzqxp4pUFNrfyeAwFYgpCSR30XlVR9gwVSztmmPgeqLcyopLQJHzuYqaPhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363802; c=relaxed/simple;
	bh=TDDB9h6jCMOmpsGVUIa0QZINLyS4wj3l4QWCvShhMTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LKwonwGVYbwN4s7nfZOH6CbBqHYevuqyyVmH233se5sIyZ+1vs32VSOd+qZi+HNNQMQFwVGsTg1rtKDDrB7nB2CJ7QZGTT6VQKRvNmMEj57rf0FsPLLqsV2uhHmo8IICPpJFUqZDry4IMT/irUsMb2VSbX7et/SykeplPiW7fWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mCTA+Fgq; arc=none smtp.client-ip=91.218.175.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mCTA+Fgq"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TDDB9h6jCMOmpsGVUIa0QZINLyS4wj3l4QWCvShhMTw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788363798; v=1; x=1788968598;
 b=mCTA+Fgqx0q7VIF1BKxZBxvH/N+TLIMVml0ynAaVnZtPdrQa11c2wjl4pP/jM+damoXFi85Q
 6Gwm5x+Loor74deH5aYWuqjgiL3rzJFJGOyTBtdOtezyvGTAbwcc0OdFU1x6SEAgwH1nejYnsm3
 ce1+iCDF2ECTdybBIzl5kRqo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d5099dceb8697313;
	Wed, 02 Sep 2026 15:43:18 +0000
X-Mizu-Trace-ID: d5099dceb8697313
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384c4so3008e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:43:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzBJS91ACr29DRMEA1oDtm5+evfb7CMSuNFoVGqFtugFMigH6RlEly20yQhWe7q0DyWMoGlfMUxsMak5t8=@vger.kernel.org
X-Gm-Message-State: AFuF++mSL7rU8spMOZUQQCOweVx2LGPvpJ5Jm7VPztUBjlUAFG70qNmD
	VccBiGdY6MBMcJofyVHH5tqGQJYUn/Wpt4kUdNqeON+1yRTtUE3vc5HM+1HxZb41QtGy+/d4RgU
	2yTBsAePemI5SWqkgMqsQdpGC4NBQYSzomP7fPNDD
X-Received: by 2002:a05:6512:1317:b0:5b1:571f:715f with SMTP id
 2adb3069b0e04-5b60d662ef3mr52821e87.3.1788363796807; Wed, 02 Sep 2026
 08:43:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com>
 <a491ea12-b0f6-43e4-bb5d-dba508120bfb@arm.com> <CA+EHjTy0jCbEb0K7Sd_+X-Ly_6fC3vuPxmyTVRkqkF_DAFMucA@mail.gmail.com>
 <0b2c58d2-cc82-4c68-aaa2-83449d0b48c1@arm.com> <2368f72ea9a447057456eb37450e1c25f4bdddff.camel@xry111.site>
In-Reply-To: <2368f72ea9a447057456eb37450e1c25f4bdddff.camel@xry111.site>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 2 Sep 2026 16:42:40 +0100
X-Gmail-Original-Message-ID: <CA+EHjTymqz4gA4OU8TULa-NROfpmxg0_K7UJd_00jFhVJLtTug@mail.gmail.com>
X-Gm-Features: AcwNN1Vqyai7NwAklslw_P-gB_E9iMkS68kcpmtYOZrPmf--aKrYMKE_RXKOiVE
Message-ID: <CA+EHjTymqz4gA4OU8TULa-NROfpmxg0_K7UJd_00jFhVJLtTug@mail.gmail.com>
Subject: Re: arm64: MPAM2_EL2 and MPAMHCR_EL2 are left UNKNOWN under arm64.nompam
To: Xi Ruoyao <xry111@xry111.site>
Cc: Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sept 2026 at 16:27, Xi Ruoyao <xry111@xry111.site> wrote:
>
> On Thu, 2026-08-27 at 09:41 +0100, Ben Horgan wrote:
> > > not, could the caveat go the other way round: arm64.nompam is for
> > > systems where firmware ignores MPAM, and should only be set on a
> > > machine that does not boot without it?
> >
> > Yes, seems fine.
>
> Sorry for the late reply.  This is indeed the original purpose for
> arm64.nompam, a dirty hack when we have no other ways to make the system
> boot.  If you think it causes an inconsistent state I'd not complain
> against adding a loud warning or something.

Thanks. After discussing it with Ben, I think the best option (or the
least bad option :)) seems to be documenting it [1]. I'll send that
soon.

Cheers,
/fuad

[1] https://lore.kernel.org/all/0b2c58d2-cc82-4c68-aaa2-83449d0b48c1@arm.com/

>
> --
> Xi Ruoyao <xry111@xry111.site>
