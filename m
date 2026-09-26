Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0D1231842
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 18:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790446128; cv=none; b=k7o0SjiwUXk6GJfh5sm4l1QwGPyJBeU+ZFhcI7nAqPBdS/oPBssNwsv70MubyuMxplGDlHXyAw1k2tLRa7SI+mu9s1o1kBHL6Gvc82QcELnZ5aHjFV1sSiRcYTcP4nD6Kq5Haaz0rzEl6fpyIBcniX1DMKf6Z6m5JTs9T7k1JZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790446128; c=relaxed/simple;
	bh=/1Is6jwITKvcrzTEMMArf5g2GgzfewQ0ZKjCE8wrIA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S64I/q6ybera3r7OF7L7LPg/d3Jjg6qRP6p5uAugNQeVpTJ+X0Da/8s5X/fWsVbtcf1jjTHhaBtzufqQuOVuGOUXJ7cllHJ3emRmyPsnbLte2ylrICq17Ps3K5PKV/gndPyLnLKNHjTku6OxFZd58svEzZJxiWSGTjS85oL0P80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4SqDFTF; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4SqDFTF"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso13160755e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 11:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790446125; x=1791050925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8ZgUyaMAO2CVOLqH2JOMYU6c+GcTyIKCAT4dA1Wtw3Y=;
        b=l4SqDFTFeCC7rDXngC4Ek/odtLFihdDpZN5DwDn7eKtdEgUKdRRwg041h60lbUuX/Z
         KM4XF+Q8EUpbYQGNgCv7zSFOjEekrsj8NYtse7Xk/KDLTmH9DLVQQtw8ITot6+60TDym
         l6h7yazNce2DITMEBaynlt/KHr1i9jLaQ4yxuneSKthEgeDWFcKNgiQCKWZYQglO14An
         JMyN85+mQpHQqgTEzXcgeTsgo3la3OOPH+X9T0DT6cTXMJS9fiWoo1NLFGqHcLTwkiyl
         L/ZF8IB81A+uzPDURSXwI4ZgN/uQfky24MdIIUuKpndeEQlTVjgfIXc4svMGQ91jvu3I
         UeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790446125; x=1791050925;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ZgUyaMAO2CVOLqH2JOMYU6c+GcTyIKCAT4dA1Wtw3Y=;
        b=FzY/2OIsQK2iGIf6MNWABN/l8+xissaskdXyaXTRSs1PTHx53Azr25z3bl8eAP5Qq7
         0JO4UQwvQjrt2RQ/ZuP0bAMJ6IIuk9KiMjW+PvpkSF/8orREH5xNLGDk8kVijZ1WLGg8
         e7X46n93DcRp7Jz81VdQ27a/7iUWifglbRF3mh8lblJT4y0SK1nRKKkp6MyYI5Jq0RhC
         sZZnCAm3b/SsJUtJZ1E/x+X8tOr1D59WCs81UMTZjkvok1nfz6sib1Fw4vz6YUU4yQqW
         b4NwdwTBVFAwoFFygUCuUzDEJM6qKlK+HhHEuz4rWGNXgvW5cvMA58WpxP1K56wIZ2KV
         Cj0w==
X-Forwarded-Encrypted: i=1; AKwUvBx4xSP7EOLzlBDbmhV3frnIRZZ2LJDYBM6SSGcqrOjDdiPn3aRJKT+Kf4MFljueUsAFBpvb+p8QXBLPgvo=@vger.kernel.org
X-Gm-Message-State: AFuF++kovj2Tf4AV80Gf8YWa/69STi/4txZyUqJelEexsna5wwiNeB56
	IJ2Tzcn7lan7ECe3CP4ZSmJK3lw/6LKAlMJt8iNMonlAwgJHFXDvLns=
X-Gm-Gg: AYBFou2mlZu1iXC1fZIsYL2iC8BnbQ8d8iRIFZM+e/sIjX3tL9putTJfgGxJPOtZx8l
	/Wa1bj9qwCuzxsNABuy+bDlIBeUjn8V5wNVkbFRyk9HbOCvY9M2m1ft+vXp4EMwD7dCbJHzcbmY
	LjUtAkFuxBSPmFRAYY6pOcPh66LkuDlJHvIPSffONIQPnYbwIjqlQvwFy+ksVSoNmzWjiAXlpoZ
	oZ3rCtZxNownyW2ac7vsa+XWU2X6uui/OUVFQLEEH3bM6tj+MxOujlL0c49VE5f8+fM0B8o7SRV
	Ss2LaWeP9RPVYaThL8PP0HHRPUE+T11dtlyIUmEuOTNZoIb6EuFjK4HgerAvBbbz1lUY9KLLtkE
	Per1HOXywX3XtbX91brNUJERiOdPHUxvj1HEJmB97hA5h4dKcIBdNwLMtGx3/+t1XS7SCCzfuhH
	zoVY8LRyr7NH2a6aBgNwNCi5T/YFiEnGJ48/Z7g3QnsRW0maNZxVTKtYAWCpAdGh0maQuBbaWgz
	QhQS4A5oA4PAICg2gFJeTeIbr+ZOScIwkCRkOrKvmtMh24P
X-Received: by 2002:a05:600c:1546:b0:49c:fa20:cc00 with SMTP id 5b1f17b1804b1-49fe66f4f59mr157154635e9.23.1790446125211;
        Sat, 26 Sep 2026 11:08:45 -0700 (PDT)
Received: from localhost.localdomain ([31.223.3.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef5fc189sm111337785e9.3.2026.09.26.11.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 11:08:44 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: corbet@lwn.net,
	clemens@ladisch.de,
	tglx@kernel.org
Cc: skhan@linuxfoundation.org,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	linux-doc@vger.kernel.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
Subject: [PATCH v2 0/2] docs: timers: hpet: Modernize and document API
Date: Sat, 26 Sep 2026 21:08:36 +0300
Message-ID: <20260926180838.8145-1-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <87o72mg21g.fsf@moria.home.lwn.net>
References: <87o72mg21g.fsf@moria.home.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series addresses the feedback from Jonathan Corbet on the initial 
submission. The work has been split into two separate patches, and the 
line length has been restricted to under 80 columns.

Habil Eren Türker (2):
  docs: timers: hpet: Modernize file references
  docs: timers: hpet: Document userspace API and ioctl commands

 Documentation/timers/hpet.rst | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

-- 
2.47.3

