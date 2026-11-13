Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794549004;
	b=G8puVjS+HI47B5lIsbA6Q4EHQAT4MlAZTZ/R5j/ttz3JulxO1F7yI3It4J4ZCoG+oR5c
	 UPI5Y1hCmA/laTyUQsZ+WUQw8fa+SPjFP6yRUngp8SOj8+td9nTaeXTI4jBJJJEeZjyGv
	 rHSUK2rILOPfetrSDxO4rsKTaXq3y4AcZo11Tg2y6UpDzFAx2O1pMTH7UtZtug3ol5NO3
	 pNHqHQKakImuaUiERPK0x5vBxKpWdP9NvzsNvqbIdsRw7UxQdY0uVq6fxDWyAT999jWqC
	 QVNl+8YlFr5MvROTZq9nNwBGWcl6BKhZzEMuuBH1PYErVwfPM5GhfGWbn7S5fhyJPzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794549004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=yqf0V0ahyBHVRuWhFtdBAiBcWunJExbVVuyktIhjkac=;
	b=Vom14y8ZywAl2VEy5fU+Tq+hnqgM0wXALCIWk5Q/1JiEyTiz3keNy4if6e6pdaEbv7AA
	 JTAfRXqoCtZvoMylPqf7w3XadjokQByLdgAHvriII/UuFNMUVC1nGPraPZDjm2wmXIsiK
	 JsmZlQztKsvQk+3vSrb2E7Eix7n4b6mU5Kmjs2vmQeDqkHQDujxBXnoW9gKCipPNKR4Au
	 3q1LW7oaevsuEROLXNs5ucYQuhXo+xQD7nKGDE4yqNM1qeLy73k45shVGpixmQ8eaiY7R
	 2ASWCN72RcDDAqa472gBkJdSLn4seIM9c0C0T6J0gQRTEjJQziuvwS6dt/xzYOB+D9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NTPs/DTp";
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CBB606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27CBB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NTPs/DTp
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso583095c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794549003; x=1795153803; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yqf0V0ahyBHVRuWhFtdBAiBcWunJExbVVuyktIhjkac=;
        b=NTPs/DTpOttjHIW/fzyL9SpFCXzDkpiHent5Xdr/3snp8dFt30h1I/sz02G02vgmJH
         hTj6mEUhHV/Pws0iVMqWw/nAbG+zsxrcmUnw27cTvEI4Ox4JgnUgIZ5p27ayfUsmXVZ/
         WPuHOBuFhOPjap26qQ03XvFdKhZ9C/kQFkfhWRU+oe8Q4ynyLyf90nmaPgvXplfPl+yI
         4lcNqdg0NRNhYanYGDQTenBGxGyThtyRWLj1v7fIRHl0vNZpcXyf4AkxSKM5zvZpwsK/
         iEoQJylQwcmd5dIftlpKh93JCQCJ3UBY3Ci6QF78WZMRjSUdhjXogNZu6bA6Orre/YUq
         UmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794549003; x=1795153803;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yqf0V0ahyBHVRuWhFtdBAiBcWunJExbVVuyktIhjkac=;
        b=Jpl4dT9vwRTASk+1e5hRCwFDLIKS3V35tlcgChaSi0zfPJsI1c1ShuBwVUUXIjRja0
         RIKu1aAyPUdLF5RaGejhuQM7LMaUNb18iQSsbMKhp7j24OgplDy1wKfgDB7a5p59oKCq
         jf+sF4JGzFNDJg0+nFRJVZA8ZkltHIta2boOW2Jzay3+hoALSA9tGkmyCGCUxOS9/lrl
         NSkNyfCJbBL4XJ9DoE5C3EmH8L8S9Obb0FuG4Lno5koWbUUInHTfi+jCIfkE3T4oTNX2
         fL2ckWHHi/2zlEQ7oWrlPN9ZG0uYiLsgpQaku6MNzmXHmUzXdZzGJAIevbW4UNPu8ppr
         sq8w==
X-Forwarded-Encrypted: i=1; AL+hErHq/O0r7o6awcRAU0fZMD27gn00Vc3Hc4Ms+07kKl7/ijiaRIqOgUQ552AWyPAhhrXxqdQ4F6upuGy4tlk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MKYql/31b8elY2jsNbY42woO8qNbMV04u1yxQAtkBqYrafqjq
	rwemBvEsnmY3bCBAO6KJq21c5P5NH0XlVSqMPhfvKYyPaNFC37tLUCQs
X-Gm-Gg: AYBFou1sqhbvXu7Y6NamV+QZ2w0evoe/GapObNvBgAUaDvZpDJ+b1JerlWy/aHAEry2
	xJ3MYdvWdthQZW5Sgvl5ZfoGQzD1yP7dZFBkl9TZrpGNyRlxQA0f+FSJf4heIQ3yvke1dZO0m2g
	hDXTsfpwsscdp/oPhz1q0KomTXF11oRp2/r7da3J+hyvBvjmM6dpXtmv48VCnED41SwtFQJEOgv
	qrw+7uuyMjqUJZ4y+Njc2BCNnyFneUtbZ/m0fxlvg4MXHo93mo3CJq7o4CiFvfIBPgQcIqLSNBc
	XUucx08Fy79vtlGw7GVO5qsAFLvIIZkrdek5x7fuAEOswVMna4fK3T/smf3RoPIZ5EWPtcIGokC
	CuJyP9GXcOkxhzovR7EH7vl2brCouFmlUojMCTUXw5q17XCkIFRl9+vOnL/HtW9I8XHzBCqxkX9
	lEiUBLta0+ONPGcDkbaqa/o0Y24a60pU4Z/xP0bO8unnmnqR+9olNl8ZpEzpMJfTmqAXUBgRDkB
	bMPqytomFNRn8pcQhxcYNkMNBQmUJRtsTqbjGqS7U8oDC7xys7vMFXxCmrLdhWpqGeuaSVupYPo
	FvvjmQllpyxh/jgOU3ygXzqjkhYae5OPDdyAr7V8LCjU/hCiKavwsgTBhK2ChJ2Hi1NV1w==
X-Received: by 2002:a05:7301:6184:20b0:36e:a179:85f2 with SMTP id 5a478bee46e88-379675fea57mr1230534eec.23.1794549002605;
        Thu, 12 Nov 2026 21:50:02 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:48f1:7a0b:9bfb:4205])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm3860092eec.5.2026.11.12.21.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:50:01 -0800 (PST)
Date: Thu, 12 Nov 2026 21:50:00 -0800
Message-ID: <f44447354f28c295e79a025bbcab7a4e@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rong Zhang <i@rong.moe>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Angela Czubak <aczubak@google.com>,
	Henrik Rydberg <rydberg@bitmath.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/9] HID: haptic: Get rid of input_ff_destroy() in error paths
In-Reply-To: <20261113-hid-haptic-kmod-v3-2-e7dfa8766c0d@rong.moe>
References: <20261113-hid-haptic-kmod-v3-0-e7dfa8766c0d@rong.moe> <20261113-hid-haptic-kmod-v3-2-e7dfa8766c0d@rong.moe>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Rong,

On Fri, Nov 13, 2026 at 01:53:55AM +0800, Rong Zhang wrote:
> It's painful to have error paths after calling input_ff_create(),
> because input_ff_destroy() frees too much things but does not restore
> some other things.
>
> On get_device failure, the module's bail-out path calls module_put()
> right before hid_haptic_destroy() calling it again, causing refcount
> underflow.
>
> Besides, every error path calling input_ff_destroy() frees ff->private,
> while the others don't. This divergence has caused quite a lot of
> trouble.
>
> Get the module and the device beforehand, so that there is no error path
> after input_ff_create(), eliminating the call to input_ff_destroy(). In
> this manner, we don't need to restore dev->flush and dev->event either.

The only reason hid_haptic_init() had try_module_get(THIS_MODULE) and
get_device(&hdev->dev) (and their counterparts in hid_haptic_destroy())
was to work around input_ff_destroy() previously being called only from
input_dev_release(), which could be deferred until after hdev was
unbound or the driver module was unloaded if userspace kept the evdev
node open.

I am queuing an input core change ("Input: destroy force-feedback device
on input unregistration") [1] that calls input_ff_destroy() directly in
__input_unregister_device() once all handlers are disconnected and the
device is removed from sysfs.

With that change in place, hid_haptic_destroy() is guaranteed to run
synchronously during input_unregister_device() while hdev is still bound
and alive (and dev->dev.parent already holds a reference to &hdev->dev
anyway). That means get_device(&hdev->dev) / put_device(&hdev->dev) and
try_module_get(THIS_MODULE) / module_put(THIS_MODULE) are not needed at
all here (until patch 8/9 where hid-haptic becomes a separate plugin
module and hid_plugin_get() is taken before calling self_plugin->init()),
and simply dropping them eliminates the error path after
input_ff_create(). It also avoids the devres lifetime issue with
put_device(&hdev->dev) mentioned in patch 1/9.

[1] https://lore.kernel.org/linux-input/2f722967b6db0692d4dd4164aff39b62@gmail.com/

Thanks.

-- 
Dmitry
