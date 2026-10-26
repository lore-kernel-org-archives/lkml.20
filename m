Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792978208;
	b=4KLGl/bwwMsW7PP/ikqNjKm0zumJkhUlstQnBSSlbRexhwzKsUoQRCB9loDB1A/aottY
	 iodv3+5zCkRrdjQzF/Xn/3OwqLfnQ91Xna3Vlvg/2a2uWkN2Dp2ShMNnLFh6ls/8w79nB
	 wRFf3g/1h0myftM8JhSSllbUezD/S873HCKIVyOmRP6ZYxw0n+WfwXUEL9OVnajATz8lw
	 Z/VLCY/pt8mfbJ3Y43Zt2kvh4f27/vHYt7lMM1828rzyXLmKIs8+3zPMToPmoFxOchLCB
	 0zoEUT30Gmzj2XWoeVy5nHTPWo2bhyKV5yT1sT5i1NDuS3nPE6ZnuHUatXSposTdbiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792978208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=OLucmKFZvG1tvT3qcDSQQ2CfWxg9+UtyealuVWZ2qVk=;
	b=tTkTao/ZbcYyVSnzLcQLQPrJVg7XAchb7LnWkbII6ASMZ5404PefLc+mCywgwHCQqQQN
	 95ikT9g/5Jzf8wQW5enKXKLZdKPlt87urUouEl81FqZlCmaATXq1Y/eoaLJkyB5pCX4eo
	 eG8EW6FBiGduwFsvPebloIqyOzla/z+rdPOqqW50jXRysj+x7D4FBREQep0oD/Zd8RS0W
	 jv1ZdF6KnMibPkBukzKA7Im8QsKUNt3XwQGtO1iEYGkg+vFDW+sTVVH/vBbvTW9i1gX5q
	 bGM7npHrvsAajVav6GR2uWUkeePCPsJ3KIhfOz3q5xMDrPUd2WcBEgCD8ihosZ99sGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=db06y5rc;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1231606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1231606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=db06y5rc
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-533861a59b8so30054281cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792978207; x=1793583007; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLucmKFZvG1tvT3qcDSQQ2CfWxg9+UtyealuVWZ2qVk=;
        b=db06y5rc/a42Q7I6gZJqHn+6RdhZMkCe/PM9bPSIkdzdKIQhT6awBXpLvTCqXMFoas
         vpdrgYSILQX6pa54FHjgkevhT0qw3vOv7aSYEbQ9kISBjZHIWOApblEsWdkQmN6fLDCk
         W24B5RsU3rGvAf0IivQNlEx9/t6cNsuLl8yuZxDFKTzIMJoEtBNayYZmAA82jEd8Qd07
         WLcOpzJBZ1ttIyv9gx4mwMIdcqToXkb+C1ma90FuzfTAC2kL+RjBEThxU4bAZuzQSInS
         TiQlkuu+Cs+eQO0ocaFK76BeQh/XfL0G6SA9Seh5Cl/7aXXbcPfIvztM8BV9n58h/Na5
         xQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792978207; x=1793583007;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OLucmKFZvG1tvT3qcDSQQ2CfWxg9+UtyealuVWZ2qVk=;
        b=ukTG/FzC8c/TF+srLQziDh61Cegafi7nLWk38eM5t84AsyYRyjtlBzwTasZQdz93zZ
         22/vMw1rbrZAjnFBGo/9Y0Gx9qggz0dOe8CFRT8i6kto/LEIS6y65J3Ml9my7rKqior9
         rYloW/EqprnwF24dd0fPxiSOXqyUbSDo/SOMfLrg8Kt9am64RAZ6tE0mypeahxijZyIe
         KxGlj/GCpklxQgujR/0GaoHr6A+ErwWAw/nef56HOswz3lSXrtjmO5AcxGj2iJTHQkib
         TLSNa0uWym0sGcVy8VEFkahCLtJXzQdqK7l+bfUfaIt3ne+IopjThIZsNaIO/CLPz7cg
         c++Q==
X-Forwarded-Encrypted: i=1; AKwUvBwF0H0FwoMj1AupTcJzVpWP/mommAuVXpS5hvbPAhTbBYqBvq5h1Pdc6KuYxtZfuI7sqRZ2Esrb5ExnLKI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJatMLFlR8fRxvO3Xykczga8S9WdKeFe7U8BA7GQchsysdFzZeI
	wBBteUrwzQpEEFZwBjtBInpHgeK20HN1vh74ofTsiJuQweuGsGHDRqQ=
X-Gm-Gg: AYBFou1+L1++RwL7dcp1y5T8NJj1E5adBeNdlmc92xsMz2snk9Nl0N2oNWGdDrIWQns
	/ua08TjP0434idTsudRXukC+p1QwTUaAtv7WAEPVjZkpkQ6PKGm1qr6D8JyFp8f2dH/gzY2tNKy
	35jFNEZLxR/I83U6WDR2jTZlYo4wMIzmU/Eo3wnfxk5FugU0YGMxMRnibn77S2RIQDNQk5cTsSn
	4FmEJvru9hi8v6qmvHOz+R3mVozqns206236coEUb460IsyD1DLd8EvZdkn2zl5aFzrdj72Mb7x
	hfzilODlLp9+sfJpf9BmxLvPenhREnUdgtbCwiAjLisuinz6GSN6qFC4RhImkmQj3/MbrLTieIn
	WDuM6wp4AHwevrB03vvKqdrS1qLBan9ykNv+7SJZMLiWpV5hZ2PEXmcoduDgzVMxgbX1HP6HeWF
	00wcQO2TH6lQ0F5c/yDK3+Omo7sYsZ+Avc3N6u9C9XPENese/j9XduZLUvmtdvM5swxRfm05iMq
	FOILx9k//Ktp8wKSrB7VvrNCwZ0TEmRJKIJaP05hlxfHbYpFMfzeNjhhCfbhKTGo1C0crLxBJQB
	7cmgI2WSdmrasY27eLsy3+3Ji3qO/2uoGnZXLu3ZEeYiRq/EXdth7BbWkAGWGMOfIyqCpy52Xl0
	Jp7YaS375o5A4oTWorwVefanHuzBXxlstY6LMwHtehg==
X-Received: by 2002:a05:622a:5c6:b0:536:5c86:cfd8 with SMTP id d75a77b69052e-5383b5e681amr81425591cf.12.1792978206784;
        Sun, 25 Oct 2026 18:30:06 -0700 (PDT)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5383970a2basm44270051cf.18.2026.10.25.18.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:30:03 -0700 (PDT)
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
To: danielmaraboo@gmail.com
Cc: brendan.higgins@linux.dev, david@davidgow.net, corbet@lwn.net, raemoar63@gmail.com, skhan@linuxfoundation.org, rdunlap@infradead.org, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: kunit: document --summary and --failed options
In-Reply-To: <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com>
References: <179250646543.2190262.8632957027583518623@gmail.com> <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com>
Date: Mon, 26 Oct 2026 01:30:03 -0000
Message-ID: <179297820301.2598507.8486986636667612321@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Daniel,

Thanks for checking the entries against kunit.py and kunit_parser.py.

On the indentation: the continuation lines in the patch as sent use two
spaces, matching the --json and --junit items (see the raw message on
lore). It may have lost a space on the way to your tree, but please let
me know if you still see the warnings with the original.

On Assisted-by: thanks, I had missed that docs-next dropped it. v2
follows in reply, with the tool use described in the changelog instead.

Thanks,
Eugenio (Jay)
