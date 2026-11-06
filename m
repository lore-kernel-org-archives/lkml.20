Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793989241;
	b=wIxFCAAF3f/HVARYT7GmKEVJPPq8HnJcV7c6AWjtJSyp2a2irqezwIQRiSTflvnv27II
	 QMEcoMvduB7Hfo/RWQYqRb1GG9mSbX7AbX8X6+ZiC/TygeklqTh4//gM0moVoA7QAKJZe
	 ok5gpMTrZgPrmcbdE5sYqBq3p+DIsZrE+qQruoMzsjj+ZHyfAJm27R+ko9S2OW0tEuEMN
	 mcBBgcE3Bv80/hSlhslirJezRuBoqt1uoelVa8b/6J2gzedkQz1YGXooidgpgIeYyTtA3
	 BngSdUzUWZWhd/I9BaiVRlOd2/qBGmdZJLZXyPxSji3kv41Y9xNRaatNAzn3DMoJkGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793989241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=9qaZQMzb7DXoF7l3soDYlbhGMbKj+MV76UM39vsbcMY=;
	b=ozHr/lPfDGulKlJRaTwE19JJwAxY3Zpt5YuEeErU/kJf42aDieZAlfOab8EU6JR5d+P5
	 eq7VIFpxFzjO2BG0YHD+zOkPMQ0ywMvCI56W/bZk0xXpaZ7WaIBawdh6fzM7G1Y0G689I
	 8NqCGIo5Hg0B5wGWgSTWK/FRR6fNlMCpdtLhq/79VhIUrejSH7juqpdgv2zss01kTAoN6
	 jy0G3GPY0PsEdM0YrfOhoaDL4ex4PT77UKgHxz4g/WkImxrp2vabJXYxQ+HUsQ24ReDlO
	 bby4ZrobT5oQsG1xBb9Sy1p82iGkj2JRDcKActY2+qTPNHbkzxEtW5vjw+kF7ZFgovg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hdq9hgQ5;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EDC606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2EDC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hdq9hgQ5
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so749360b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793989240; x=1794594040; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9qaZQMzb7DXoF7l3soDYlbhGMbKj+MV76UM39vsbcMY=;
        b=hdq9hgQ5D5WGukz31Z5zUw40C0NII9+8G5GH9bbZGnHfAnojoP57z8tHMmhX3hRi3G
         TAEZnNIl7XxI9nA/PCD69RWqu7/2Knkm9ucEaCvPIsFJ1c0y4Ac/raB06y/h4vHHeTu2
         hrH7qlIfvjY7PR8AnU/6c4zFLEnn45p8w/5FfOhg888gnTl+fqudKdJfz3T+gsKSeJR9
         fVgO74BDLxLtH551xZ2aswoR80e7+rpwg71fLO9mwB4xwBk6IE7kQPbsFqWnmLpSqjUl
         7q6IQrSAjZcGOGyBu+palvwfywQO3OIBnIspyAaIbBt3U/ybx1R5Aw8UptwUCkXTV7E3
         PFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793989240; x=1794594040;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9qaZQMzb7DXoF7l3soDYlbhGMbKj+MV76UM39vsbcMY=;
        b=W3fm/WO+bFkVBpvP7yCeoOflJdBxqQ+d03ujahb34mx1idG+3vlBpVSIb1UGJa4uSF
         VZULTpBLHAiW9yE6vWuypZrguoivRiLc8BrvmdrpUw7mRWzG1fB+suq+YNVeKyuZZz2f
         g6Fj2u6lClJFrLCo1UiFVFHZVBhy+f7xlKn0LK3bHNa+Z4kFub39V3F+Eg9/atFxozB8
         UUGdEpVtVjud7DUTUvGJfXTwqjKCg10B1ClJfVLgspOQgAh3dcPyY86SQ7BUsnyA+KpO
         aAMDJ2iHY+1CeK7FnhtrkEyGa09G4pgYmFnwRgE1RVciuChZu1C2wccH7jYsc4rVQ/6M
         V8lw==
X-Forwarded-Encrypted: i=1; AKwUvBxX1HUKTEsmHU6JWXlzRqnQTLNgVXc7rK2TJsHeIeLvd+h7RuA803Pgw7E8vtHtblpYVwJNju5S1jB+TrE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FK64d8ZhF6FmHK675EP6hbga9R0ygar25eYYczDVl3VdikIj8
	ngwrwBOei3k4tjzDFOuISHwuqr/Eqfx6ARX0XE5s2i35ezHaYImQmK2xXX+5z8WTow==
X-Gm-Gg: AYBFou18zZHmx1i4SPW/5CbhyqvSwUDkX0Yy7uhaf/3HhJGYjg3M/IJy3ka4OdNalX7
	Kt7VgsB5AM8a5H13y2XvwTVVlSXmzKzwC0aYvccvqL2bljBWCDimQ0GdiADUEQ9G2T28JfmdWOO
	EhlYex/SBjbXjmg5W7gmF/ScJ7sk5Xh0xvLtJUhTK9jkNi7MITOcZHi/PVfLQtqvpm7XtoX0HqQ
	dQnia/q3NwcrhkYw0WX2upNEa4gj0uRD0kTn8R5VYlEWE2QFkhmDGm2v01ft6S11QzFy7p3d3Bd
	LuXcqhq+dy0ElnFOWHMRVDPWa0+YhgL5wwYqYyS8Pi509VlU3/mW+vpHxwICxKyXTmPQDhafXpK
	AWiUDmXWziCQf+PtgW+RTxRTQPdDxUWxQNZYexI4XGfsbrzTGPpxyZlHTrPuyt8fTlXvlTpOxQw
	+jIziBKEl2Vrj7o1/0dHjq3+fm6q2f3nGISIvMMo9W/qTxA2HWeyb67pvGAG7sJVDE4TA75dXdB
	FBI/fEFXDFxqcrZKclOsVnpeQYjPTAeunsljo0YO0eVcEng5Zs2TsWYZgOs3smKF0y22Lo8qhRT
	GRQj9YiFAyEdw9qh57K6nSyysTw9s6m1hSjGzLm7jMMuAS+/8ofelbBbmRQSnDto
X-Received: by 2002:a05:6a00:2188:b0:8a0:3483:51ec with SMTP id d2e1a72fcca58-8b37cdfd31bmr3344310b3a.58.1793989239208;
        Fri, 06 Nov 2026 10:20:39 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b359128352sm848989b3a.13.2026.11.06.10.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 10:20:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 18:20:36 +0000
Message-Id: <DMOC3XV68W0K.3FGK4UZ87838R@google.com>
Cc: <kexec@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-pci@vger.kernel.org>, "Adithya Jayachandran"
 <ajayachandra@nvidia.com>, "Alexander Graf" <graf@amazon.com>, "Alex
 Williamson" <alex@shazbot.org>, "Bjorn Helgaas" <bhelgaas@google.com>,
 "Chris Li" <chrisl@kernel.org>, "David Rientjes" <rientjes@google.com>,
 "Jacob Pan" <jacob.pan@linux.microsoft.com>, "Jason Gunthorpe"
 <jgg@nvidia.com>, "Jonathan Corbet" <corbet@lwn.net>, "Josh Hilke"
 <jrhilke@google.com>, "Leon Romanovsky" <leonro@nvidia.com>, "Lukas Wunner"
 <lukas@wunner.de>, "Mike Rapoport" <rppt@kernel.org>, "Parav Pandit"
 <parav@nvidia.com>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Pranjal
 Shrivastava" <praan@google.com>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Randy Dunlap" <rdunlap@infradead.org>, "Saeed Mahameed"
 <saeedm@nvidia.com>, "Samiullah Khawaja" <skhawaja@google.com>, "Shuah
 Khan" <skhan@linuxfoundation.org>, "Vipin Sharma" <vipinsh@google.com>,
 "William Tu" <witu@nvidia.com>, "Yi Liu" <yi.l.liu@intel.com>
Subject: Re: [PATCH v10 05/13] PCI: liveupdate: Auto-preserve upstream
 bridges across Live Update
From: "David Matlack" <dmatlack@google.com>
To: "Bjorn Helgaas" <helgaas@kernel.org>, "David Matlack"
 <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261013162529.1928093-6-dmatlack@google.com>
 <20261106173427.GA1633106@bhelgaas>
In-Reply-To: <20261106173427.GA1633106@bhelgaas>

On Fri Nov 6, 2026 at 5:34 PM UTC, Bjorn Helgaas wrote:
> On Tue, Oct 13, 2026 at 04:25:21PM +0000, David Matlack wrote:
>>  static int pci_liveupdate_preserve_device(struct pci_flb_outgoing *outg=
oing,
>>  					  struct pci_dev *dev)
>>  {
>> -	struct pci_dev_ser *dev_ser;
>> -
>>  	if (dev->is_virtfn) {
>>  		pci_warn(dev, "Cannot preserve Virtual Functions\n");
>>  		return -EINVAL;
>>  	}
>> =20
>> -	if (dev->liveupdate.outgoing) {
>> +	/*
>> +	 * Endpoint devices should not be preserved more than once.
>> +	 * Bridges are preserved once for every downstream device that
>> +	 * is preserved.
>> +	 */
>> +	if (dev->liveupdate.outgoing && !dev->subordinate) {
>>  		pci_warn(dev, "Device is already preserved\n");
>>  		return -EBUSY;
>>  	}
>> =20
>> -	if (!pci_is_root_bus(dev->bus)) {
>> -		pci_warn(dev, "Cannot preserve devices behind bridges\n");
>> +	if (dev->liveupdate.outgoing && !dev->liveupdate.outgoing->refcount) {
>> +		pci_WARN(dev, 1, "Preserved device with 0 refcount!\n");
>>  		return -EINVAL;
>>  	}
>> =20
>> -	dev_ser =3D pci_flb_alloc_dev_ser(outgoing);
>> -	if (IS_ERR(dev_ser))
>> -		return PTR_ERR(dev_ser);
>> +	if (!dev->liveupdate.outgoing) {
>> +		struct pci_dev_ser *dev_ser;
>> =20
>> -	pci_info(dev, "Device will be preserved across next Live Update\n");
>> -	outgoing->ser->nr_devices++;
>> -	outgoing->ser->devices =3D kho_block_set_head_pa(&outgoing->block_set)=
;
>> +		dev_ser =3D pci_flb_alloc_dev_ser(outgoing);
>> +		if (IS_ERR(dev_ser))
>> +			return PTR_ERR(dev_ser);
>> =20
>> -	dev_ser->domain =3D pci_domain_nr(dev->bus);
>> -	dev_ser->bdf =3D pci_dev_id(dev);
>> -	dev_ser->refcount++;
>> +		pci_info(dev, "Device will be preserved across next Live Update\n");
>> +		outgoing->ser->nr_devices++;
>
> This looks a little funny because prior to this patch, nr_devices was
> always incremented in pci_liveupdate_preserve_device() and always
> decremented in pci_liveupdate_unpreserve_device().  Now it's only
> incremented once (per device) in pci_liveupdate_preserve_device(), so
> it looks unbalanced.
>
> My guess is this is because previously we didn't expect to preserve
> bridges at all, and now pci_liveupdate_preserve_device() might be
> called several times for a bridge, and it's all just fine, but it's a
> little subtle.

Right. nr_devices counts struct pci_dev_ser entries that are in use, so
it goes up when a device's refcount goes from 0 to 1 (the entry is
allocated) and down when it goes from 1 to 0 (the entry is released).
For endpoints that is every preserve/unpreserve call, but a bridge is
preserved once per preserved device below it, so most calls for a
bridge only change its refcount.

> I suppose the "(dev->liveupdate.outgoing && !dev->subordinate)" test
> above is what allows us to just increment refcount each time a bridge
> is preserved.  And the test around pci_flb_alloc_dev_ser() is doing
> basically the same thing.  I wonder if there's a way to connect them
> more explicitly.

Agreed, both points come from the same thing being spread out. I think
both can be fixed by splitting pci_liveupdate_preserve_device() into
"already preserved" and "first preservation" cases, and moving the
nr_devices accounting into helpers that allocate and release the
struct pci_dev_ser, so it is visibly paired:

	if (dev_ser) {
		/*
		 * Endpoints can only be preserved once. Bridges are
		 * preserved once for every preserved device below them.
		 */
		if (!dev->subordinate) {
			pci_warn(dev, "Device is already preserved\n");
			return -EBUSY;
		}
		...
	} else {
		dev_ser =3D pci_liveupdate_alloc_dev_ser(outgoing, dev);
		if (IS_ERR(dev_ser))
			return PTR_ERR(dev_ser);
	}

	dev_ser->refcount++;

with pci_liveupdate_unpreserve_device() calling a matching
pci_liveupdate_free_dev_ser() when the refcount drops to 0.

The helpers would only manage the entry and nr_devices, not the
refcount, so there would still be a single refcount++ shared by both
paths, as you asked for in v8.

Since the series is already in liveupdate.git, I'll send that as a
follow-up patch on top of lu-pci-preservation. If you are ok with that,
then an R-b or A-b tag on this patch would still be needed.

Otherwise, happy to send a v11.

Thanks for the review!
