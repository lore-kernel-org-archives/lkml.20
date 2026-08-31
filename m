Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8871A9F96
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788138933; cv=none; b=Rvw40EZLU43eAP+hsmitnWgD1xbeFZ+uLpo/lijgaYLfZ2FKhTkDG9rXhYlPuOsmFwER1u7TCCc7tkabNY0iWyjZNV2DRrJnD/U9zkB9LHPQPWi1YFufAUo8GAh6MbHIP+6EEBJLbLxhK6XwcHpAeuMm+nZ7WE/Lyn68e4Bdh2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788138933; c=relaxed/simple;
	bh=ON3K5XgKP7gpRDE7IbiXSTStuvEcMdc7cC0gAPZ0DiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emuISd8xi9OqXCwgxpEFnaN23Uzq57ngBzaMzW5Ed591Q78xgL/dHY74pWfJ0ONJHiTyhSs1ARY/rHFuC9osT+ZiP742fN/b3KDbNxd83mMDzoNRdBsLHbhtQGjMmRK2K4nCTviTsMWsN8BtOxI7nwxySN1nOiqirLHksw46+vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=iOfrV6XZ; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="iOfrV6XZ"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-930c0f9c1b1so197928785a.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 18:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788138931; x=1788743731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M7y1NLVwXUSf08Tsy0vpaiU5Gq6j9SvxOp7x3iNDJJw=;
        b=iOfrV6XZLm2+LHelUrpBUwPlEPq4ag2LNyEZpv5qe6oqZqKj6YXE+ibF4XR737tw70
         se12RMLfxK6vGAFU7WiBXbT9W5Jk9rkQmBJsuI3umMLY9KialMhMvfykFZoSmUqB7qds
         uGzD4Wr8tTMN7BQ6uxsKogbBjWwM1Cr6XN6k7oW2HNzbtytWShQoD1qje5inzFtA2/7u
         PYlCRmp7yepP5wdy3U5X3mJPgItyQEhxecZUstQqlcTM+WNw5P5p/bOjzEbzuwj6MhI2
         SO4bN1AeSK7oe2S99b8xJ9GnIpLC0n87RyD/htzr5XX/qdQqLWmbZSgtaHQ0VXj24YGh
         YKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788138931; x=1788743731;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7y1NLVwXUSf08Tsy0vpaiU5Gq6j9SvxOp7x3iNDJJw=;
        b=DTnNd01rgoFjTYlnGW+yujAa5KR7lwYBw8cc3bqKBvPGNGJ3Wz3oQ32FfmfMUCfgfM
         +thMTCABuvh7j1QgmsQ03c2kOh1PyDjM0zPXU1VtPkr5GKd65t8C5pwwaBlLjJwOwPTC
         vqGB+5F8NRuORPDQHkayJY8wGWi23ghPf//er/R2iUmcBhaier6mRdoIN/TB7l2RfQWc
         nwEkzZR6e4K3thby6Kc2d4wIQqXg4I/NyWrwKoXNwdv37lf9X0MgxqHCRnPuUOjhoT3w
         Owkt51asPtM5NfszkITyjU8jc6qnolfUgzuLGFW4dqBwuA3UdbIAWCMdgaWSP21/80Fj
         0bZg==
X-Forwarded-Encrypted: i=1; AHgh+RoQAz5UAylEnOSW/Ko3d/KR3LABiECxPZtcl5fVeQaUXdUJvlsHCRw/tfIQ0AW1jaZO9jL7KMgM4kLRu8k=@vger.kernel.org
X-Gm-Message-State: AFuF++kwt1fn94y566ZKa+EIwQI3jatBLJ813lb6O7uFXqhspNDeVzIp
	CeWpjOp001EaCnFVrFhzZrzxNnrnWQZSX06pN5ca/uwFqccKyCVx0TVDNH/1yZOm8kBywd8LFZe
	a21+vCg==
X-Gm-Gg: AR+sD124ZTlwcec1VGR0uqy/jDRkVvB+N/ltn9MQWN1S1Ti9DlkaWkgMb2drWitkszm
	gh2ptMAQhNakgF6PE9vJ5Ul9M4MHlZ7zdEa4wtQHLlBqVC0uyPz86ynQyMg4wsk7D5vPfJezZgx
	cYF/W5zEPhLcg3ExQHQJ3ohiCRE+5pcF1sCCg3Ggcr57EX4uvH17s/iUugCY7xHrn9IZZD0qaBC
	EGZXMlZVogDTk41OT2zkCi8+bAfzoVUDjFLMUY9g1zJo145b5fc/+QJpEUGMK1Uu/thcjRVv9LF
	k6NP5+TkwAzGz1N073t1Fqaa6umckccvs/4PeG74gFWmvu5Y4sxpcfXY0A05swy9ICJkvCoHNB7
	aRf+EqlovIaYRtZ4+L1HvqzP6vPKOj4ftqKcRA7cXuYeE7qWpDS4XanI6eCXJj+XAVewaMBqKn7
	6nBmt2xjnoz2zIjueWaoFxcHJsx9T0CfeMPLtvfpEo8/syzWstQaHx855HkoBcEQ==
X-Received: by 2002:a05:620a:8392:b0:938:e23a:2ce9 with SMTP id af79cd13be357-9393fcf9d39mr121937385a.16.1788138930985;
        Sun, 30 Aug 2026 18:15:30 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce451513bsm71976996d6.35.2026.08.30.18.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 18:15:30 -0700 (PDT)
Date: Sun, 30 Aug 2026 21:15:27 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Palmer <daniel@thingy.jp>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: ehci: support controllers with non-standard
 registers
Message-ID: <fef8be63-ab17-475a-a77a-4dc874d1a704@rowland.harvard.edu>
References: <20260831-gemini-usb-fotg2-v1-0-8a8ee12c4b32@kernel.org>
 <20260831-gemini-usb-fotg2-v1-1-8a8ee12c4b32@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-gemini-usb-fotg2-v1-1-8a8ee12c4b32@kernel.org>

On Mon, Aug 31, 2026 at 12:24:19AM +0200, Linus Walleij wrote:
> The Faraday FOTG210 EHCI implementation moves PORTSC, omits
> CONFIGFLAG and USBMODE, and needs controller-specific speed and reset
> handling. Add
> per-controller hooks for those variations while preserving the standard
> register path for existing drivers.
> 
> Also allow a controller to reject full/low-speed isochronous transfers
> when its integrated transaction translator cannot schedule siTDs.
> 
> Assisted-by: LLM

Which LLM?  Or is that the actual name?

> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

This is a pretty unwieldy patch, which makes it a little difficult to
review.  Can you split it into, say, three parts?  Such as: one for
the port status register change, one for the port reset and speed change,
and one for everything else?

Overall it looks okay; it's just hard to check the details.

Alan Stern
