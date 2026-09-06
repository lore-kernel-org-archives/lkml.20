Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8589A3E49E4
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 10:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788689237; cv=none; b=p0MXrPlY9Xo4z7sYdVfvofqYQxn5BCnys9RvQzlZ041oFNmntBXuLhYLvUsh+vsslsznkX8KuR1DD4DtwzLaS80qvJ94BcWCUHUsYEkWZHwEhl4v6SXZbyTTNdGovDfXt+zO9lIjCrBGcCPUuklwL+Dl+RvqUtVlEG9VB7VmCpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788689237; c=relaxed/simple;
	bh=zdPwZrvfJK7MzyGkqu9cVdFV8gXhIeOCnL3vxgmUvv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MN2QQPEEkfdLWcYeXQo1741MtbAotQx7q9LGJ+W8itC8gBzDgniB4wmQRU0c4bxLN8eSANFyeIwy6NOonTdrCYIGnjumUOnCy+WndcMrdMuWoFL7DG/qj8TAPw6HGnspzWEyK1cqw0KnIzZjgiau4fUwSKNkfNdxRKdPJJNGDjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lF3g+X7I; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lF3g+X7I"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b5f21afe8cso4473581e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 03:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788689233; x=1789294033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+3ouU/PkVGCvjpETYDZTI0h0W7DBwEzUInQxKxjqn74=;
        b=lF3g+X7I4MJQO3LpzEx4ezUBBEPff8jVBGvMBGuxW1/NGtZgfeI5enbPFouTUHw+Zb
         7Gnki5fWEiQR9FG38y9A8sdltFQL3MvjZfr7IPyKUVLHW7Qye00B8Cv+s4OgMH1Fp7e1
         rP04tVMpRoctJRQSdDIHhL7U1Jfakm43Tlhy5ELsya/LFhPfFlIq8mQUu1dCIN7jVcx5
         jpQO27gya1uZoP7aC4lISdjNFEc1D3OZamhRwS4tVtD+KEzuLJ/HEXUzJZcEz0aoBuza
         k7uHg715p3QcvgY4OFX98cj2mqboUE7r11s0pb9JKjUFKfj8Z2r16P3gnE9VoOuLbaww
         jKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788689233; x=1789294033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+3ouU/PkVGCvjpETYDZTI0h0W7DBwEzUInQxKxjqn74=;
        b=LTBKumpDYPSRDVQw1GdNqM3k36f3Ho6Y03rBy6opJKJ7nbAXkTxIDoCpEZuBTPIFoR
         M/TkrY2RCnsP/f8N84N+Xv1FtzTaFD+mxGMHxIzSv1GnfIzveOaZhNwjUUoy9Kveb5tf
         EgKot8T2e9PEvDi4jmEio267vxbpI2tdfUXkGxU4rdIrmlNskd6EL9yAeEBZJUCVWIvB
         koMKIK5M/UuMVM3cGImXPgofo5hGYynMrPUpAK2pL0YUF3+Oj07dW8tlnynx9Db2upVU
         EpJIy+ewgkPmu58vxcMr7rfkRFc+h7qqcUnS0Wti1zZNRksA4o2F7MLxdwkPgKdB8W/W
         1ksw==
X-Forwarded-Encrypted: i=1; AKwUvBzwqVVlZ59cjibUhUdrzKfnsZuI1ncJ+SkDlGIBW66abzMZq98YzzrC3Pabu0PJmlWt00peooGQpQzxICI=@vger.kernel.org
X-Gm-Message-State: AFuF++lXJNyhM8hCPeUGmLkgrGUZE37HPcVv4tDxdjb4EyrFmtZD0o87
	UaxwSUX1+6agvcWRDjeDMVAxGj5wYDLIK4QQ3p98xsw4+57Q350xNr/v
X-Gm-Gg: AYBFou0Q1Q6aftNaf6b5qvFBlpWi4AixFUpbKt9Yg+1V0IuJFGKQpMcevg9AlbtNVKD
	2T5oODt5WWvDBG176N1PndHtanK5sQhfH1DlZa0ENaPzA2uxGw2xdvDeFruyBb3aPnkfFy3Dh4y
	kEZriuxOoRoYzQ5EUJS+COjFETVK/HbbVWUJjkqQ/HwUZUeg4Yhen+zYSC2HSlD0FV+CP/qqWyC
	x6w36LIGuTZLxz2gVT4rHMxX+JmQWRLtfGLW3wiOLZpgnJ7t1MlG4rsSxNB1g8zy/PI4dKdPMzp
	8UsftFGnHCVoWz+EITjPd1PkBLMOYb9ySWJ9tyX6ml1yq4MNGF8LfyV0MDa8rYRzfus9Yf7yONz
	MpB49nqkEkdm8yHABkgzFNgbukNpD4QV8aOJjDhrsAa/3ZvccybH/5Z7EM762RpyN6blRIPXoj6
	AVN0HAHxbBVugDvecFsf9gt2F3b4DQjS9rApSLP2Abu2MMqiHi+/W0k06AbeiHXgoBQ0J0TcKf+
	K/1YpCj/4x9FEs+/LazqFIlgG6Gl8e8RtuhZRh45vdq7EhVHT7gtJIJlWV6rJ4M0wyvjQ==
X-Received: by 2002:a05:6512:3d02:b0:5b6:10bc:b863 with SMTP id 2adb3069b0e04-5b61768ca49mr2220492e87.17.1788689233221;
        Sun, 06 Sep 2026 03:07:13 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b619820db9sm1486211e87.54.2026.09.06.03.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 03:07:11 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 4/6] iio: pressure: dps310: add triggered buffer support
Date: Sun,  6 Sep 2026 13:06:53 +0300
Message-ID: <20260906100707.435298-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ao1bBFkLXIIgNl49@ashevche-desk.local>
References: <20260824201203.396651-5-zoone.rupert@gmail.com> <ao1bBFkLXIIgNl49@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 25 Aug 2026 12:06:12 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> Hmm... Is scoped_guard() too bad here?

Jonathan asked for the plain form on this handler in the v5 review:

  It isn't necessary to use guard/scoped_guard() for all locks in a
  driver if they actually hurt readability.  I think that is the case
  here.

So it stays as mutex_lock/unlock with the goto. guard() is kept where the
lock runs to the end of the function.

> Side note, at some point makes sense to move from 1000 to KILO.

The site above it is pre-existing, so both should move together in the
cleanup series rather than leaving one spelled each way here.

Rupesh
