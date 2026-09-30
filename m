Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F073FA5F0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790785730; cv=none; b=g+HIiKRFbeI4drbYvI+03X0EXaih5tJUPcFLjxDU9sZBw+ORVINYph0UOKitbtoOc8s/EHbpX/Rtz8OwSwbU4pKL+gR9RMny7VyFe2YJyeqpaJNVeuY54hYdQekXQblYKRPHRL4p6Ev49Izt4A4Zvq5pmDtH2ZrIIQd1zXU1uXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790785730; c=relaxed/simple;
	bh=wWPQGvFCRmooTy19kDcLAJie4vdq6nA3AQDscGDqXK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NeVqAUL2NeI6oe6w7YKcZ6rBs/o/VeBg1+K8kKei+7w2sJ2v+Jb3erVUu09qUmI5TpfyX5l0PQqaKnj3FK1TmyGBqWU8Pow/HjjA+zU2qNJ/3Mu2EGfHlCxfTKcjXmYigYpXeUkyYkZShEkhve15zOdkEpOgoqHnsPqGONQRT50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSdGnX/r; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSdGnX/r"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so32171545e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790785727; x=1791390527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wWPQGvFCRmooTy19kDcLAJie4vdq6nA3AQDscGDqXK0=;
        b=mSdGnX/rO/fDniw159ICr4YHJ23/JxI4zuDcKxjQAbH2kBGsGKJqkZcnp35ILhkUeO
         G9V1Vreco85mdtPq0NbKWyxWV5NLoXhvnZSy38Ha6osW4xWiH0cekXnQuz+EbdJc7Cyr
         MPbBH/+VYeg+TGFfqNcUgBRL4bt4KPTSP6dxWeAgKTmAwmZYd75f7cTfAqRM+TSt+SFM
         5SNDGVZHFdEEZe8kUvWUwme8EJj0we06jRv+EI/+ZPOCaoW3iapJqpD2ozhrjqGAF2LM
         kRQ44WUQ87jdvf9TcHviewHnltaIKGiN5nwdAYHYSdHWqnKjGqAAWkXSVvViKOnve29I
         lPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785727; x=1791390527;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wWPQGvFCRmooTy19kDcLAJie4vdq6nA3AQDscGDqXK0=;
        b=qtfemcNWHctuh7A9Z+NWD6GrjxT8Ht1zjQj7m2xtivG82dBLLuTPiRGmDxVYlMpT5X
         4/uKNW2trak7FrclyUI/Int6sfYNuCA9SChBDEr1AULuDAzUYqN2c66EKHKd/oXXOC/q
         44QE7CDgpdE5e3F+fFFczUc74EXvFkijqbORL3lSRC3h57ypAijsOCtzBZAH4Di3ptSP
         DURcw4G1cbKpoN3lfrqRcsIYWVyVuiUJXXidbpJ3182HkQNgEMi7aG1ZLydISjvLtO51
         0GVCrUUY5VFVZyrgVcyr/IWNeeqbMHlijccthSxmfmJ6v0TJgEg+ehP5VDTiUbExEzIz
         N60w==
X-Forwarded-Encrypted: i=1; AKwUvBzqBO6D3Y+SBEU/GLp92T4ZuJglRl14i8hWG4hRDykyi9qumb6iqNIhL+q4RnezKmZRn9sM1+6j5JjGHE8=@vger.kernel.org
X-Gm-Message-State: AFuF++kqBMbN8p3cM3ePkfjKDCOylJqddWHiWb6ca7vNYJx2LD7OUivI
	0opqoocHbC6Wp6RxefRPUFEsuSUx+RbJQ6yoUTisVbPae3c99Jcgu2Y=
X-Gm-Gg: AYBFou3zAqBhH0AvQj/+jr9oS84kD8ijB/6jgqZf1uZj4PsXLz6elBDmKwfY01JEuAx
	jUupyjp2gmi/JduivtA7/csfW5ltwtP1XRi+cfbaH1GkovQNIAgEnh6mp7OQ+iDOTxruy9+ZzOB
	59rVHdRrVQR5x9F+MmQuAU9Kb1wROSOaLJMnKB3SlEyxictacgvCRagSIWMtaJBdfktqetqfTO8
	BWDYN2qQi1ATDgKUSMSbBb89c8uE8ugtFg1q2PwdejOB8eiS3K7E4TCfAaFmugYQ2mWNcDA+TXL
	Sl+r91fNmwZhbkOf0vm80CnGNXwVruZoPMJ3QfOoGK6XnpVmuC6za6YJUR6d3K/Ix3v48ZN/8y8
	ULPoYSCOBrmvO5wwU46VPvRbKETOQTZ4xzHO4XiYZimYe2CCrqLpJ+vpYeOhCv6DaTUkA62fmLY
	Bl9EhxJDbVF3xHxPcEx8nhJjQG5cWMXTCsNZkMm38Z7lyrXjAlqb2GlT9lMzxtAq3WnGP5dY+dy
	yZh2K808it8mfTPh9BGQK0sRQ34sueB6JWzDsOpBbjl5aPdOOObQ4Yx8YSRpA==
X-Received: by 2002:a05:600c:c3db:20b0:4a0:1ea1:477a with SMTP id 5b1f17b1804b1-4a01ea147d9mr4823005e9.27.1790785727060;
        Wed, 30 Sep 2026 09:28:47 -0700 (PDT)
Received: from localhost.localdomain ([31.223.26.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01eb5ef77sm2595265e9.1.2026.09.30.09.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:28:46 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: corbet@lwn.net
Cc: anna-maria@linutronix.de,
	clemens@ladisch.de,
	frederic@kernel.org,
	habilenterenturker@gmail.com,
	habilerenturker@hotmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	tglx@kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v3 0/2] docs: timers: hpet: Modernize and document API
Date: Wed, 30 Sep 2026 19:28:39 +0300
Message-ID: <20260930162840.6623-1-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <87tsn7wtqm.fsf@trenco.lwn.net>
References: <87tsn7wtqm.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jon,

Thank you for applying the patches and for the detailed feedback. I will make
sure to send new versions as separate threads, use the correct Assisted-by
tag, and avoid trailing whitespace in the future.

Regards,
Türker
