Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696F54EA368
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451871; cv=none; b=mgheIFTEsy54K56rxRNr47YU3FVEyitEvKkuGwEL6/zkxRsJ8zPwXhFPbXZrIm452lOJNgtupaqiKu7xQ8OuI0l2yJYdmNhtChnKx7B75ku7JTPJPhRl7elZMixkzm+MXKgIMGQ84BZLMc/nxDwTo0cWgtsM4xHmDqg5BT/hbCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451871; c=relaxed/simple;
	bh=7y/YeoTdXNEh7ZIpzOeizOv9NA3RBjXR7PfihMVPEKg=;
	h=From:To:Cc:Date:Message-ID:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SDxQs7KoHhIKA0iZUzMqTWUNiBjjf/iwl19BRHhCGAj6pGrNTyXX2Vzbj/vo+1nUCTb3wyItxH6RySe4WZudt7iH/88MM5yDgPFtcnmsBBHC6HycjmH1TySihCrw47p+9b+1B527WfC9lRfTx1xVd3BrSBMdP1X0v3oTWH0VFn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cwd8MJWd; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cwd8MJWd"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-482e4952a0dso6509f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788451867; x=1789056667; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:message-id:date:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7y/YeoTdXNEh7ZIpzOeizOv9NA3RBjXR7PfihMVPEKg=;
        b=Cwd8MJWdTEEflS7XpYwyUTv54T8ivJzvjnnodfAddd1WcBSisGm72bFgXAaAiNHNKN
         F2X0Ruj5KZiytn1LNfNJZCGFYTrsfb54CyJmUYFvVmZV18VhRPuRbFhJP4PBy4WpoXXT
         u9VkHJFur7Q8HO+BK4D1mQA7ya/xlJ0si58hI/T78Wp6EbEzQrSo99xe+dJqOyixdZd1
         jLSHUvB+RWbGokdXWOqYcozpap282KKDwyxBQ2KWlQ3lRBQBkEJBKaJ9e0jpfmD8EWjw
         dFVKNImShvCASqTZ+uPaVGhb+NcPDdilY39Y04ju0PMVJGCuT7wca28yjGQudVLYu60L
         yOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788451867; x=1789056667;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:message-id:date:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7y/YeoTdXNEh7ZIpzOeizOv9NA3RBjXR7PfihMVPEKg=;
        b=T+AlsKWAxT0H/x1yzQvATt25dVdUQX8wFqVVt3c48CD65yFpeJqynCTZQL65q1D2hu
         NYPAV//JZUtSF89hBXi4UIkNm6yPh1X8Ceue+SChWLoHofVTjbx1t+QHv9l7CbaXldEj
         pjRfvbj4ace98EgAalK4ozO+7tzqkxUYwS7Bq/TG5PVOfMRnBU9K9qnTn+tATMBF09aG
         Bdur3uXgy73PHCjnYZS7G4VXVcokpTlUIFzNIdiQ08/kfejtHbUABb7l4euLa+0zrQyj
         hlkPin60HBNjlec85EtQgYZ8YCjqM7REdu79hQek+seJAvR43yjZjZmczxC0Mik/ZLyz
         rSNA==
X-Forwarded-Encrypted: i=1; AKwUvBy04+DkbZiBWi/EjBDUPsFsRuwDROTar6u0Jd6/SZdGF1NVztwnVCKrskLryyfC8Nu5GeipxKG+cWx+FI4=@vger.kernel.org
X-Gm-Message-State: AFuF++kor0bAbfyrDh75Pg40JZhwRXNe01xJEr6LEJvggYBpyQd5Wiso
	8S2DOpgef2LhN2Xvj8Tgz04Pz5i53r49MsxdspnzzqvcCRG7SG4Xx7fk
X-Gm-Gg: AYBFou0jw6pYUyQD9M3fCBWUwcJ2qIzTX6+AM4/ZT1Wp8ButE9jNYY+ultW5tappa4b
	hY3xX4QHsLe5DR6O269RKInMlMAEGQ7G5MGpHgDKtcCbQgN9KZF59mrD5UTUm0Pbz/ABy++UMts
	FCAsG/Sb8u4qKX2V7XLm+s9UyPiAVuoOcZ8xL/d8xEoAhbk1uV2R6nbwLWrHJLrILwEt2rqoyro
	oZ+ODusOqi00rBv7TnFjpLV99Zif8fAhmYvXEkAp9AddziHr9HMyOy1Ak842sS+HGDqTugOYboS
	TPt+rSqn1pFGJtJ0ShaPWv6XkAjESRGjcjt1JyyC2yedlyPjLl5Svu6K6oitx8pGKuO39+SKmpa
	PW0WWQ9ncGOSlkiJQiOaozj3VysD9S4SlOisCye0NbKlWDVH2msrmgtfnMGAZM3tu/dfhdWDbhG
	vZ106bVDP8+QZ93Xvjm4/G4MntLcUV7SKCaJrImk+6LcEuriFRlvLvNm9C23ga00Ie22A6hf4Hz
	QuU9iwHrAV0+E8Rsno6MkQWnhAQOKBp/Mv551VGDgdYYFbbMShBkM68BbYx/br8WRGuTcDIP0Qk
	QDtZjunDxVlNFgg1gR/HmT/MuFASf9ag/A==
X-Received: by 2002:a05:600c:5253:b0:49b:916a:e553 with SMTP id 5b1f17b1804b1-49ce558f53amr119012195e9.0.1788451867490;
        Thu, 03 Sep 2026 09:11:07 -0700 (PDT)
Received: from [192.168.1.144] (98.102.222.87.dynamic.jazztel.es. [87.222.102.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf2abe1basm49686565e9.10.2026.09.03.09.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:11:06 -0700 (PDT)
From: Miguel Garcia <miguelgarciaroman8@gmail.com>
To: stable@vger.kernel.org
Cc: pvmohammedanees2003@gmail.com, akpm@linux-foundation.org,
 joseph.qi@linux.alibaba.com, mark@fasheh.com, jlbec@evilplan.org,
 ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Thu, 03 Sep 2026 18:11:04 +0200
Message-ID: <178845186455.1865019.13911237622799207209@gmail.com>
Subject: Re: [PATCH 5.15.y] ocfs2: fix deadlock in ocfs2_get_system_file_inode
In-Reply-To: <20260903152435.1801594-1-miguelgarciaroman8@gmail.com>
References: <20260903152435.1801594-1-miguelgarciaroman8@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Please drop this patch. This branch already contains acd5768c7363, a backport=
 of upstream f5b1910e23f1 that removes system_file_mutex and fixes the lock i=
nversion. The older trylock change is unnecessary and can cause failed direct=
ory lookups. Sorry for the noise.
