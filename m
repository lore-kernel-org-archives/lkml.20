Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CB4140E5F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676418; cv=none; b=TQW8xtF7yAtsYBb9BgPsPCt8cN/EeD7H9+eyITegCirk/IEOM4mwDbb1RXa3npbIHWtA+k9sfO3oOQ7fg5xkZfzNRCxn3PT8BFV5HYu9tyQLOu1CY3b6nQAigQwhD6x4vkFUWjioq5twMhrZ6fbHP/HVjF76tTvmQD2WmX6+USg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676418; c=relaxed/simple;
	bh=M2+HHLFcYk7VtvS0Umt037Gs6V6AShQYZEnBPnokhyc=;
	h=Message-ID:MIME-Version:From:To:Cc:Date:Subject:Content-Type; b=J1ucQ4xyuqk3C2d8iyS+Hucwk8ilC3/elfeVTf3HJApatUSUzL8ObExLPeP/F6hjBqGMm2c3i8Q7OwTL2E0LJ7nbtNhS3n+P6cS0CJdZX+gqYL62/obNUUDVLfcngBn/8aORaF3D/1z+7N+Ben+ZddvBsVBnLColyfpO6TidZO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GtHYvsgx; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtHYvsgx"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-142dd025d07so3491491c88.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790676401; x=1791281201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2+HHLFcYk7VtvS0Umt037Gs6V6AShQYZEnBPnokhyc=;
        b=GtHYvsgxqFb2t3A78+M3H3ME5PyfdB0PLiNaX/2MXG0i/TmNpnpUOO0ThAgNhwuBh+
         6CSBb5WO/YhR1kHjV1bVXv/YPM1upfcJMXvrTZGyheqh9m/Yjy+lAvHJBNepyoJ/7kLc
         If34+HdCbilSnVwi/mw6/2mI9LFqkE7jHtIRJkPmgI1Pi8XcwkADtioDWvXjuqSKZN3/
         Jx6wV8qzHeIcfqRy8a31b60sgccAR0I3JdjGel5dlCsjh4qZjNusxq770PPWi7sobCPi
         Nc1X/gkyf5vH0rsPdS0MHPlMZzZDf7PzXOD2ujTUTcH0znw9yAS5J1AyNHTIDPea007Z
         yYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790676401; x=1791281201;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M2+HHLFcYk7VtvS0Umt037Gs6V6AShQYZEnBPnokhyc=;
        b=qNTt4hWLGQQFQJAG9iVXBlWHbOCWHVlWzXA5KNa7zrHEWXs6FePew8/tfM5mx15bDq
         tv8oXlCqx3O84Zlkc72Xwui13CRYMKFJu5SGskT2Mzn5qQt2oeKME3I+ZOJKQbunN0D/
         Q0lyzZ43G8Pf5p1cVv8k4pMPTfTzNvz1j08wLfmzL1zJEH1kZDfIIbeBrqFrZaNdRKzZ
         FbyzaLL8fU8k1H5ty2zAZg0JNJE2dCJ62mRuXP4R/ZEdM9+gw6IwQzW+/o1GNl3XHvuz
         OT1OzrWUILfkcjDfYety04Rruz2XMNCrdjfWgSrcyyWvvpP2K2ffWCqS1PdQFHNvK+VM
         vWTg==
X-Forwarded-Encrypted: i=1; AKwUvBxvrj04R1oAvmffW9mpzKsZAVl7WI+v9YIGdByeIrK1JRfUHECcAGiKO6eSLfTnmLVV6Q9RyjPiK1F0aeM=@vger.kernel.org
X-Gm-Message-State: AFuF++lXHoUeZYK4kqpPdDHjj6uYXvQsq9f7bKqBOY9VsGLW/JDJacy5
	HsBcP+q37d7AQUNhYJxc7wIwWvVGiKZlVzT4iGkEfvDcgsH+Q2lE+F3Yb+8fqixb
X-Gm-Gg: AYBFou0QKgrH3kvcz3/dbTkt4RRpTZduEeT1wydIA6+XX5ru5jNn4lXSoSmO8QThbrb
	/SCYgzbTX0mch1emcnhK6vQe4x1XJ9HolxpZTwWUpQ72aRPo/jq75aw3kTx2K2TsJi7+cjyO8U3
	ePwoWcJknwp6tiegW8vxQtr8ZAizobecBzLYL4MGQjInfSKnMU+eLxpwa9uGHx1Yd8Rs6VS7chr
	7daeqYHZ3D59xQen4tv0Ai7cSp2QFzq1tSOr6EWnBelePU5vWHWLRlTpMSSNa1VrIVNnCQM08sS
	oghVacuvWs/ak4GmEJpA3+4kdCXwikq5CpoyDZa5L9JCV2742nZmFRFDWybvq/HQCTBTOQ1/s/W
	eFgyjV/Emvrs9do4XcZbecqTqBjSGOIH8p4S5A/OhsZdpJlqhuVcPde/dXi1ZLRDKKpjV8pdywb
	RVztVlC3YQbHJ6P7XISs54Ww/bvauCd4KSjQFdTnuCDIvozhX3YUbHjqZ+WcB8ACJUb+PbTFeQz
	myc49bACbOWjwJwjmSkRyh5NCA7/nTNo5nZywOh497xe5yqpSbNOIHNTz6tHcDA2UE=
X-Received: by 2002:a05:7301:da88:b0:33e:a173:4aab with SMTP id 5a478bee46e88-34270aad672mr11969632eec.14.1790676401025;
        Tue, 29 Sep 2026 03:06:41 -0700 (PDT)
Received: from manush ([2406:7400:94:b571:88c4:97ae:bb47:4040])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34b7a4d1f42sm3244951eec.23.2026.09.29.03.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:06:40 -0700 (PDT)
Message-ID: <6abb8db0.721b4d7a.30484d.cb00@mx.google.com>
X-Mailer: git-send-email 2.46.2.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Manush Prajwal" <manushprajwal555@gmail.com>
To: ukleinek@kernel.org
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org
Date: 29 Sep 2026 15:36:40 +0530
Subject: Re: [PATCH] pwm: tiehrpwm: fix copy-paste error in obsolete DT
 binding fallback
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Uwe,=0D=0A=0D=0AThanks for the quick review and for digging up=
 the Fixes commit.=0D=0A=0D=0A> Looks right, I guess it needs:=0D=0A=
> Fixes: ae5200d22716 ("pwm: pwm-ti*: Get the clock from the PWMS=
S parent when using old bindings")=0D=0A> =0D=0A> I wonder: Did y=
ou find this because you still use the old bindings, or=0D=0A> by=
 code inspection somehow? If the latter, maybe it's time to drop =
the=0D=0A> handling instead?=0D=0A=0D=0AThis was found purely by =
code inspection during a review of the PWM=0D=0Adrivers, not from=
 running older bindings on actual hardware.=0D=0A=0D=0AGiven that=
 this fallback in pwm-tiehrpwm has been effectively broken ever=0D=0A=
since commit ae5200d22716 was merged in 2014 without anyone notic=
ing or=0D=0Areporting it, it seems very likely that nobody relies=
 on this obsolete=0D=0Abinding anymore.=0D=0A=0D=0AI would be hap=
py to send a patch dropping the obsolete binding handling=0D=0Ain=
stead (from pwm-tiehrpwm, or from both pwm-tiehrpwm and pwm-tieca=
p if=0D=0Ayou prefer keeping them consistent).=0D=0A=0D=0AOr if y=
ou'd rather keep backward compatibility, I can send a v2 of this=0D=0A=
fix with the Fixes: tag included.=0D=0A=0D=0AWhich direction woul=
d you prefer?=0D=0A=0D=0ABest regards,=0D=0AManush

