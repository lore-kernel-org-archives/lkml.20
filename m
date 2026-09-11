Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D894E360EE5
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789167144; cv=none; b=XlqfYX5GnDxVyCee2SjXN02I/8QuUGthdGBWN7rp4AZE1LdbmpoQYOjI81tFFQAXJJaDX+MXYq0ma1i6bMvwqdQJO1CHOk02bMvd716ePqijOAb5ZS5h7tKQ8Jhtxz84EgAlC11fh3e0BI6GwyBSl35bkPidOMYKU6MiSTsGwMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789167144; c=relaxed/simple;
	bh=ftNgNKh9VdMtBQc1BMR6LWCIRqVgg3TsQH42M2mPoM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t6z6eOqf6XcFHMzkxapbuXwFhYomP17PzfnjcGJiELjC0qMTgk0Y3OCNYk9w5jG7ZyKlVUXJI+0pVACvQHmtrpy/fovDSuFxK3rqDO6hm+1kmFCT3z6/Ak10HUzbDBcWWsd8FQ8QB+RIILjAH5nyJgSFPHfG1nXZlW+ixr48vQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqQf315S; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqQf315S"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd80so37558f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789167141; x=1789771941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7lRQ7+pGNaq5SaCh0WKrw3A1f+kuNcEq+sHWBo4gNe4=;
        b=DqQf315SJ/JWMdhy989zvhfWFkmDuSMxy/VyXWEl9Hf0a+2vT5O900CGxDOX4INU8D
         qos5qmamsGMQhoCkoJjwJ4ft/YKIxxZ3OJGa4ch/XSFYhE+O+0RiurJqYnq6Q0LUyIkx
         Yv7nnjilncGlrVarKwVQ84qqIkVwyrxwmyf4MPRXU9AFKG7owQ7K1aLN2ayfhBQSUZVj
         Qv4bLFW5KbvNMS+2QGwqxUuqoAADKaeZ90SBULaRcHWCn8Apeq0K3j84K39xn8LgHRvt
         3LChLmcrEHDMsCdwX0a8G133UXrJoJzK2YVUsmNEYnSdauUUBdzvsUVua/CqZJZSAcUm
         1INA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789167141; x=1789771941;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7lRQ7+pGNaq5SaCh0WKrw3A1f+kuNcEq+sHWBo4gNe4=;
        b=MjIl4th9Fef4fS90mPcL3jcHc6+lszsU8Ib6LYLexRFb6A7vFizxf/0FhjwIWsD86h
         RhGCoA/QtBAhAjuQL4cGP3Yz7aWZX0BiD122dPAoPSjdktvgrgp9Imev16tKxw6RNfsg
         5nJT0682uxuAbNKpwv3mmfyDW+NLa2OsLkscBv7Tz8eOYRKg8SN8kmSoUkxI0RTG2Gvz
         RCgVrB2jALH3nW5+b+X2fSTTzCg9OkZaQm0du1wK5pLIRpJSnZG2KdL/QZUG2qDP0i3V
         75roRt7jNwLptd4972UXbbgRv1m93jR0SYzB2UJzhJ6SW8176L9R1bwQbWENG75uevpW
         PsnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsBINkUAxDl6JI98/aRz4cZlrvMf1IFD59VUXVRIdLr53B0dkxMgqcEwKl2tCocoETc8YWVZ3H/mIzWNs=@vger.kernel.org
X-Gm-Message-State: AFuF++npM66W701VjxdHC7Slco4uEs4oYkhR2iVrv2h0JHQggcUIU76f
	vcf8vmjUjmRU+kveR+Hygd6SoSpyTG0PPuA8e8adgtlxDq4HpfvjgomWRo49aGd2
X-Gm-Gg: AYBFou3cxJBvdumrzxxGWfNgYfeaHGCz6loUlFGcY6/khTa67NXUw47CE/3sYMExDat
	xEXWN5cvKJ64nAUwMMGoAOz8RaJzZ9Ef/ZAdALNdZc8QwyAJcTabD3IoTGlxb/YeLu+1aWohug4
	8SaHs70b5Gsh1rjOuQOQRodwb9xaxqJwjPkQAh1De5s3E8y5bElfht0mQnD1PCB6cqeZ5Cv5xcB
	XXSkjmYmxlXvvERKQHAMBq4+E3QEKnZzXTe9kN0p/IWRfq732jnX+mi1BS9Oackc2XBwUVu6UBd
	T+Ju5yniJlJ2dpg62SmLiA3eM35SpURyx/N58d4G4mYdHFdMf8NOb68kK8Z6o8JNfxxUit+4lTW
	tT/6hLp8NavOzwjWxEkp3L3DiMFx3WjzH3qlSiqIKsN7Qtti5nTz2G7hVTztkWDQGDfuLSo1tKr
	iOrVdX3NKwKU+ybm9lkMAMLeqVFhErOE10kcjegrS3l1QOFZBp1TrrlW7d+Dun80wSMmnj1NZhT
	YzwfiJfmx1QEDnFC2ytMHOPd0+yVB44vHxdKC4uFkFHsOPMQGs4lRCY9tj0gL6wuY1pF1NziRve
	ttngFAc47SzqRg7Wr1wtgENBf1tVqd3Z5w==
X-Received: by 2002:a05:6000:2082:b0:484:3f15:15f2 with SMTP id ffacd0b85a97d-486f6c17cdbmr430823f8f.24.1789167141058;
        Fri, 11 Sep 2026 15:52:21 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb357288sm8936891f8f.29.2026.09.11.15.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:52:20 -0700 (PDT)
Date: Sat, 12 Sep 2026 00:51:49 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtualization@lists.linux.dev, jasowangio@gmail.com, 
	eperezma@redhat.com, xuanzhuo@linux.alibaba.com, jiri@resnulli.us, 
	sashiko-bot@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] virtio_pci_legacy: drop callback sync on reset
Message-ID: <aqSF5m8rLza4vf05@gmail.com>
References: <cover.1789160982.git.mst@redhat.com>
 <572661b65eebb784652e5843944d284bbceb2954.1789160982.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <572661b65eebb784652e5843944d284bbceb2954.1789160982.git.mst@redhat.com>

On Fri, Sep 11, 2026 at 05:20:18PM +0100, Michael S. Tsirkin wrote:
> The virtio core now synchronizes callbacks after reset,
> so the legacy PCI transport no longer needs to do it itself.
> 

I ran 200 instrumented virtio-input reset cycles over legacy INTx under
KASAN and lockdep. All 19 callback/reset overlaps completed before reset
returned.

Tested-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Karl Mehltretter <kmehltretter@gmail.com>

Thanks,
Karl
