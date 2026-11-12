Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501880;
	b=AJ1FB/b4f4EVPvFRpxHZh5RARXoYVt6XETf1C6M7JpVbIAK/L74NnIY5LrchlQBQ3o5z
	 KPH2kEqEVtY2xh6RlpiLRH77RIawE/Ft6mIUD6ZPGEEP+KWIUxdYiAgYQ9NjqKiAr8Ksn
	 M3bP0/RWLkG69cucyPxnYt0vfXVXnXaoTae8IdRA/T6kn3qIgIxbtC5igs+m5KSdLH0R3
	 TqoY9UXqqj2Ywc7+zbIDHo7Tp08cPqEIz2/dv5RLw76A9TaiylNGBs+pWIsRWYMCV2Udd
	 8w4aUCrS3xcVEW9BRb5ba8TDy7pGDTE8gCPMW1M+Ee97lG7WTNbSIb8BevYVtMi46Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=L0I0n48oV5o7BRj/oH4f6pc2kqveIFdpMiqQByS78r4=;
	b=pCUaVQst+cJxpfqqB8pH5mIM0FDMPQ2LTSszB0CWuZyENqD/lc/crCqQJSBYvPhPQLtd
	 de1OCwp772hi9MWOTbcmVI/R1dpldl/Avzyj0Ggd7dFaZLCk1eWM8umy8XBQbmF5kEDaw
	 Zoy/eoUrOV3KaYcFznHHHMOd8Q4g65ahcigp0wYHI9S/sJuWRR6C9sS3sCRtLjJlbZ5Dl
	 yDNbiJ9tFZSCQLBd1s5FQOgYXF7eH4O41DcuI1W2npNwhfBfsBVK5k6bqpfooqdPTf4Rs
	 uTaFlzxBNbAC0VnaJvtNuDuZDlLFR+5Y5/uCMvOjCdUOTfoF9R3vhQC9uvFZO5Sb7kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SuIlegSD;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F00606A331
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62F00606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SuIlegSD
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so155153eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794501879; x=1795106679; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L0I0n48oV5o7BRj/oH4f6pc2kqveIFdpMiqQByS78r4=;
        b=SuIlegSDTiqLxvrjbgM1Q95iPFjnvtJm1AHCpbYH/Aa1M6ec3/6OeF0Inudj0wOHYZ
         yZ7mAckhOQmOJVRTYUhe2ll5Ca8hBUUGL8CDuNM+jE2if7teqm7z7i2a60bjAqE65pzp
         K1mWu1/+QywHczH0apEZY2OsitrAMzx8FfRoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501879; x=1795106679;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L0I0n48oV5o7BRj/oH4f6pc2kqveIFdpMiqQByS78r4=;
        b=OIRB+Mt2K/dEHtxiSQgqj4GIDQVDUBvgiAupsQe4kuSxEDQ58L1NeUn9t7GHB1/E1N
         z/r/3sxLbMCftRRtUJZfx7aiP8JwyU1A7oi54JIn7oAeeRUSedlrWeukth+TB0h+oAJL
         0KiZInYaan96++zPwBBFTZwgxEICb4VqoBc19ofKpwNTkuhFVIREpsgwTFAYJdvR+tUJ
         xsoVf9VQm5VmJC98tlzawpSPLaEc2HKOk7/pb5/qXQq3GPvz6YF2sEDtFOjsWeMJWtfg
         stHLlhd0pkZijEAU8gC0LE6X0eYMjp+WIZXXbWcgL/I4YP53uQEB0nJ1ovj4RAdjVF+u
         nz3Q==
X-Forwarded-Encrypted: i=1; AL+hErEoFYkzRMRwpCqG+ZCYIfQV28q6b3OZTTIlkMCwD3v7oIdl66af49W49chQS9kezeep5C1R+gNgViiObVQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PcOSaZnPh4ntdubveMemB4z0qxYqQPDr/IYoS3nz0kPvPB7QA
	UwmN98N60SShOCafeVvV3HsIksCTXUsU1+YNDIPzsrvR7+usmW7tCU5Wrg4wy3VQTg==
X-Gm-Gg: AYBFou0Oml1qDBFbBVEfIJ6QX+Ea9m2X+380bJyM0UNQDet6+VeTMmP/hXn1DrISMdq
	vmz2ggNfbaBqZiLdw2sJEtWP/IAy/fxWNa1h9pkVKX7YGE2Tii/5l4D4x1aQjiJXDGTH13VRxTT
	Hq5Mk/Qx642yTBgRkeWz7p/noE6MVNObJjIlNoepN1jDxUh4a4rw89QcWDS6KAcbxgDfNv8Yqel
	vRWFcllij6IVSL/eF9gNVl+vIo6oLOgWQqevwdrcP69M0xEe7oU4tmzBbXc6WWJBm7bG6XjEG9s
	ErilwibdGLHtn5qteVIqlPNsESiv5a99xzfA2HricF6VwY2VJtLclSpUs7ufWRnCRNqoeWcFcTp
	o3hzI7f/3OREP5FBSFR1YeV8IMrj6E5wZSCn01UaPX+vsRTnhkvH77tKIDcNOPGhBhSbuqZJwFM
	8o1pjdi1wAiLR+fqZ8vrfO5h5FjCRLuYkHtJIkklAOAS8XkEZmKC/yqd9L/8V2vYkMYZARtvbTe
	oR82NKXU+/Htk6mJUZ2LV0jP49A8dBgrMZXu1loJXIN9aTCWm1wUr2pwG8lOFzwdLcixNyMsodu
	EvIQvuCL+DhgGmFLt4k4XzYK7sWLUIkkE9mPaJKPo5W1eDIUOIq6BdqTso0RAdJ2AnUD
X-Received: by 2002:a05:701b:4551:20b0:194:3a84:e67d with SMTP id a92af1059eb24-1b5031b37dcmr81202c88.44.1794501879423;
        Thu, 12 Nov 2026 08:44:39 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:5446:563c:ac92:43a8])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b5031b2519sm137097c88.13.2026.11.12.08.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 08:44:37 -0800 (PST)
Date: Thu, 12 Nov 2026 08:44:35 -0800
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@st.com>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v2 3/5] PM: runtime: Propagate last_busy from dependent
 to dependency
Message-ID: <avXs826ikSctpUnA@google.com>
References: <auzlLwlleGLPsLcw@google.com>
 <CAJZ5v0g25xQeRaLJWJyAo2fcJko+gZ7w6JhX7FzMgRx2+uuimw@mail.gmail.com>
 <au0oKFb9CmNzc6Cg@google.com>
 <CAJZ5v0hKpjMsGQm8Cpa89x5wkNxqkggDNbp+eQ0S-E52DETWjQ@mail.gmail.com>
 <avOw_4ZkqtKFHu1B@google.com>
 <2c3bda2b-ccc3-4430-8e09-81b25f6fcda7@rowland.harvard.edu>
 <avSa97F1Nu1LTSCA@google.com>
 <fc43eb13-816b-4cd0-9711-848fdab605ef@rowland.harvard.edu>
 <avUHG8mLuTOUMr8O@google.com>
 <CAJZ5v0j+8_fOc_EEGx4tquqcaH3-nmHd0YMJRb38t2Rw40iV3g@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0j+8_fOc_EEGx4tquqcaH3-nmHd0YMJRb38t2Rw40iV3g@mail.gmail.com>

On Thu, Nov 12, 2026 at 05:13:09PM +0100, Rafael J. Wysocki (Intel) wrote:
> On Thu, Nov 12, 2026 at 1:24 AM Brian Norris <briannorris@chromium.org> wrote:
> > I'll give this some time in case Rafael had any other thoughts/replies,
> > but unless something major changes, I'll plan to write/test/submit v3
> > where rpm_idle() calls pm_runtime_mark_last_busy() (part of Rafael's
> > proposal), and *not* make it conditional (i.e., no
> > pm_runtime_use_autosuspend_always()).
> 
> That will work for me.
> 
> > (Or, Rafael is free to do so, since it's his idea. Just let me know so I
> > don't waste my time on it. But I figure he'd rather someone else do the
> > work.)
> 
> I can cut that patch.  It is going to be a one-liner if I'm not
> mistaken and I'd like to write a changelog for it.

OK.

There's potentially quite a bit of follow-up, including patch 5 of this
series (to drop now-redundant .runtime_idle() callbacks), but I can roll
that separately if you'd like. (Would you want to make an immutable
branch for other subsystems to pick the 1-liner up? Or just apply such
patches to your tree, as it seems the IIO maintainer was probably OK
with that?)

I also feel like there's probably room for unit tests in this area, but
again, I can do that separately if they still seem valuable.

> After that patch though, using pm_runtime_mark_last_busy() elsewhere
> will be mostly redundant except for pm_runtime_*_autosuspend().  Since
> all of them call pm_runtime_mark_last_busy() (AFAICS), it looks like
> last_busy can be updated directly in rpm_suspend() when RPM_AUTO is
> passed to it, but if so, rpm_suspend() can simply set the autosuspend
> timer unless it is already running and so last_busy can be eliminated
> entirely.  I guess that should be done too (in follow-up patches)?

__pm_runtime_put_autosuspend() still sticks out, but it's nearly gone.
Its only user is just re-implementinng pm_runtime_put_autosuspend(), so
obviously it doesn't actually make a difference. I've been waiting for
someone to finish this patch...
https://lore.kernel.org/all/20260806-smmu-rpm-v4-1-8183d007331c@oss.qualcomm.com/

So I think you may be correct.

> Moreover, after all of that the difference between pm_runtime_put()
> and pm_runtime_put_autosuspend() will become somewhat academic, so is
> the difference worth retaining?  Or can we just say "If you set the
> autosuspend delay, all async suspends will be deferred" and drop the
> "autosuspend" variant?.

That's my preference. I think having so many put() variants hurts a lot
more than it helps, and especially so if the differences are nearly
nonexistent.

> I also have to say that I agree with your remarks regarding the
> .runtime_idle() callback.  I don't think it has ever been particularly
> useful and life without it would have been simpler.  I'd be happy to
> just get rid of it at one point.

Great! If a few other things settle, and I find that I'm able to clean
up my existing patches to my liking, then I hope to submit such patches
at a later time.

Brian
