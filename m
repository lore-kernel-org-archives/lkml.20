Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794447052;
	b=u+fhIIgvlgVsdYOM/Vm2xlPgpjz99eAO53fY4JGEFaNoV0LXnKFwq7DWnHAjCeNh+XtP
	 Yb4JHhZiLv9jFnmkMmGGg9wkYpWzl0MeVtQTYkzqd2Eli106ZFmKpBwhZAFKNe/Sgc11l
	 eiRWl7sJ/Xuxw3jkL4EtyrrZMb6yxmItAjudPSxSQ8BWPqVJGmbB6szKCxxS/Wi7HSrLO
	 s55NUVMsyF/iw/YZ9DE5Q4M52mY+j6NHfdcGL18t2+AwXakdDLR0v7Z1gUllTxDCJXD9i
	 /k9l+c9LLsSHfzOCJWAiAm7IDpS/BlZ+fF+NwJ2utlszucdwePtcLyYOpWI0J5sy3Wg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794447052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=HqBe/NHPOfDuseWK4ioMq0nhIjGOS1NmAr1BxJILYZo=;
	b=KGEJB9K4dpGXNRtGPuXCLE2nyV1rdt+fX3OayoTVUI9SVTbB3sUbGABvGUyx7arP+rD2
	 ld1+hW9pw9IMvlV5TUzomw6pKmuy+lfp6LZHHHBlW24dfgavbNtmj5NlNu2lIMZJW0whL
	 4hT8+3Lc3/lrfHNj/FY3GGUVxmxHhFAvO/h354i2/ExcTYabGx4A8L+gIQ7fPIjaCiVdQ
	 ZKtFlBt2y9T2XbiBKkawPPLhGe8RFurFDJMgf51Dhuv/+s9K6vW6ZOrRaG9DT/fsfuVNB
	 f7nhfdZHIVn/WZwWo94HkYCH0bTJMRO6HuFgG9EkPNOHKQ3000aSv86fgAjjULOExgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="y/lJbvwI";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C340606A330
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C340606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y/lJbvwI
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6798af41644so3178975d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:30:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794447050; cv=none;
        d=google.com; s=arc-20260327;
        b=Rzdy5SBBW3fRKtBw3QZDHK06JofPov0EDRFWF4lNGAsWIu6hSTTD7Hk7NQJpso3CUd
         NJi72es7yMtYrRNHj2zGuqE4+LNq0IfFxGIYcq6w4Bt6USs+2KF9g0NbcY10yvMb0oEj
         N8GlbYzXz5iKhjguagdrnoc+bllw3KZmoMB3v3S/M12ulnOazQKtEknq/R1TBV5lJE9N
         /sUq3XaK7Q6YI1gcjLGG9I0LTYI0PklismGiuofpJmJODjaBDQiBj0xNgEiwBMFlmdbz
         wrxv9JWpMrKg6t2+Jg8hTi6AekqF1W3RwFBNz0u0YzVAXEK/oeVwRcQTt3L9SddxojkW
         xg6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HqBe/NHPOfDuseWK4ioMq0nhIjGOS1NmAr1BxJILYZo=;
        fh=8fk27+MdfpbvR1K7dTVdQb5DkKfQRwxH9Po1rrQ3giI=;
        b=Aegbo/wk0o4nH+OY+PlvSTqvVtFMSQJiSRZ5eYZUG1pqJ3wRiBHFbK4ygRe3LgSTiu
         Dk4f8AzzJNc8kMO7VsZjemJAZduuetygoNv0+8XYaB9oQyCUIXhT7STUGAwqewRyyXpt
         ALP5Mh+UPRfPSJNaiBhG7cxjBZNZKvzIiAo3+RH8x+yAOd8EUv9PUdHIRcllapv+40dM
         z+9o/WhPeS9YUS9fgGKLGQJNme3E4ODxXZu2koY30nLJ6/l5XAqU7w1eJvq9WVD44iXv
         Vu5XywQPW15c9gNNyCO3c70tCDqHZIMH+21hZFvDfEKygW7Zq/PdOQ9vJt8p3xnnasJJ
         u7PQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794447050; x=1795051850; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqBe/NHPOfDuseWK4ioMq0nhIjGOS1NmAr1BxJILYZo=;
        b=y/lJbvwIyJUNJf+iEwafVeL35qIQWE8o/yeXSsqV0WGo+yOTlDXC2TfsnDpKk4r4fW
         HCoxpn5CZBPzHnJ7/IA6clIhxD1oYcHmpWIyu6zFOgCWPNBrrzqm79d1oz8lUsqSUKfd
         VCaJc/Ol5yOHkrrJ1OEH19HZiQxszCOV2SSXU2M81MZZGOT8hXTPoE73rKWjqEeDsDkz
         FaxJJuPUzndKoNpp1G683K9uSe2twR4KP1v2/Mk7WLf9BdBWGBMLVT8DrIzRHjeuVeSV
         nJ2pNVVnLDZUa+sG/jwBRjAiuLT/+iKjLaH5xtDs/mVr08+C9jbn7LMlymxZVfcxwWuO
         sQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794447050; x=1795051850;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HqBe/NHPOfDuseWK4ioMq0nhIjGOS1NmAr1BxJILYZo=;
        b=M7xkwqw+a3S8i+zscE0Q9B032WWD7BuzxeT5hB/0xG0Bc1wTLjweLQuUsRepZPNznK
         /YEnoDi3Nl50qelH7ED+FLJaUnEuLnriSTILP1IZ2r00FtRJyNxh/FMgpgu0trZCasgm
         1qLMlDOciXA+wivfPAM3BXYrxatH+NHGaGwapw6CfxYI2AaWZaK9yVb22VdDY2xGkKnO
         imbrlKXxMKad8u6RceSHnBhVb3/F6naPa3NkAkTsB1cfcbQ2oUxfkPppdyg2Fxata42G
         eNd/yGAoomjJtPpxT9BcgFxY67/pvYcv6Hmdr5qavyDaFNOz3NQaUf1fP4Z5VGuEyb1Y
         oKhg==
X-Forwarded-Encrypted: i=1; AL+hErHXXkXEzmivUN4S0TcRS6O+GcmLQ7X9wO4GDqciXYMfRNPmhrAo3nGxdJJs/kgkmxrmY5/ZZ+psTNHVtF0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AG91Z0E33F7i9fBvRMUpFPEyc7R9kYiO71Ma4O7oW0fyoxWDi
	y1ghDXycETJgodv8W1glUMnXpW0oWP1Ft9nkXk64OLSmmUp4gVF6F0y5qrN7BU7uscqbJ+7IDZi
	W53HZEstNDCc70mE+fK3mXzyUcF5rbw5RdB6hBZ928Q==
X-Gm-Gg: AYBFou0dpYPskbwQFIsBl4XxgISIWESJrj8Lr3MxaaQs/ebIyHpYgSixEYxR60s7LEU
	vzxrwckfkX9o/oTqlwPhGBC2aa+kRPVSSkOBLTKAPBLlyuEvpAsgbuHt32u9Cmo1eI+pzvFvFG0
	MrDhWmbkXXELTROVoRdt//NVahGvezVYLBfgacMDADM7TAyM1ZJTySSrHhSZ9yizkpBQUBM5Ox5
	4XJR4HQL+HggeoMwXjRumNaK57M1IdNU3DJzPHGtPkHJ4Im8pFWJVEzlm5z8vNqhHsnC+xIYyc7
	8FBHKjEnhfouTMCoqnIg9xoPhpj74VHkzR8TMsw9h6vkRlGWtLDGl2fiUFm8MwgPByDOTnfYCDG
	4gOKYZWggkZLszyykka2hymI8kJxDRzVOCD8aIEL4sNhtnQNv5aOeWLV0wHuka4eNl01xesn8TW
	plnn7dEI780ze5TD0=
X-Received: by 2002:a05:690e:1445:b0:67c:257a:cba8 with SMTP id
 956f58d0204a3-67c67ee4afemr3040960d50.15.1794447050552; Wed, 11 Nov 2026
 17:30:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
In-Reply-To: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
From: Gideon Heinz <gideonheinz02@gmail.com>
Date: Thu, 12 Nov 2026 02:30:39 +0100
X-Gm-Features: AclHuK93X2NS4OkDx9i0xCDJ4Jv5CPtODKBLv44HwCgLoH-cBZXhsL3lMnkWxMQ
Message-ID: <CAPb1+K2BxnfQ7VUQ15td5f9pVhn-ARSM9EjfOU8WuW72o+cvPg@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] HID: logitech-hidpp: G920 force-feedback fixes,
 rework, and cleanups
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	=?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
	Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, Edwin Velds <e.velds@gmail.com>, 
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,

I tested v2 of the series on my G920 (046d:c262). Everything on my
list works except one scenario that takes the whole machine down, with
and without your series (last item).

Setup: Linux 7.3.1-1-cachyos (clang build). The pre-image of patch 1
(blob 60fc6b86a085) is identical to v7.4-rc2's hid-logitech-hidpp.c, so
I applied all 33 patches to that file (every step matched the blob hash
recorded in the patch) and built it as an out-of-tree module against
the 7.3.1 headers, loaded with insmod. The only local change is a
3-line fallback for devm_kzalloc_obj(), which the 7.3.1 headers lack.
No full kernel build.

Results:

 - Initialization: "Force feedback support loaded (firmware release 4)"
   on every plug-in (8 in total), no -110.

 - fftest: all effect types are listed and the effects play and
   produce force. After exiting with -1 the log stays clean for 2+
   minutes.

 - Input: wheel rotation, buttons and the hat all register in evtest.
   I use other pedals, so the G920 pedals are untested.

 - range sysfs: with nothing holding the device open, writes take
   ~67 ms and read back correctly (540, then 900). On v1 my
   closed-device writes each ended in a "Failed to send command to
   device!" about 15 s later. With evtest open it behaves the same.
   100 reads back as 180 and 2000 as 900.

 - Replug x4: FF loads cleanly each time.

 - Unplug with evtest open: evtest exits with "No such device",
   "Unloading HID++ force feedback" and nothing else in dmesg.

 - Unplug with fftest open (6 effects loaded): 6 "Failed to send
   command to device!" lines within 1.7 ms of each other (v1 gave 12),
   then "Unloading HID++ force feedback" 19 ms after the last. No
   warnings, oops or hangs.

 - rmmod with fftest holding the device open: rmmod returned after
   2.99 s with "Unloading HID++ force feedback" and nothing else in
   dmesg. When I then exited fftest (entering -1), the machine went
   down: the first time with a garbled panic screen that I couldn't
   read, and on later attempts as a total hang with no output. The
   same sequence on stock Arch 7.2.11-arch1-1 with the unpatched
   driver also hangs the whole system, so this predates the series.

   To reproduce: with the module loaded and the G920 plugged in, start
   fftest on its event node and leave it at the effect prompt, run
   "rmmod hid_logitech_hidpp" from another terminal, then enter -1 in
   fftest.

   I could not recover a trace yet and will send one if I manage to.

   My guess, from reading the code and not verified by a trace:
   hidpp_ff_create() stores hidpp_ff_destroy() and the other FF
   callbacks in the ff_device as pointers into the module. With fftest
   holding the evdev open, the input_dev outlives the driver, so when
   fftest closes, the final input_dev release calls ff->destroy in
   module code that rmmod has already freed.

Not tested: the battery patches (10-14, a wired G920 can't exercise
them), in-game FFB, and sysfs driver unbind.

Happy to test patches or send the full logs.

Gideon
