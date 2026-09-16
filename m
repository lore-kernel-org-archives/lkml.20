Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDD94A2A40
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561939; cv=none; b=bgXmEervvpLEykE5AJ0Tc7ruO7PVIAYiHaj47WeChMNjoIk+xzVk44lrHJOqvm5zEuZSMF+VsG6cRR6vreiUuoOmCXktEl52jOiqCFS5D2oThSLGO0skTuRzPlJYyUstgh4zEhrxpfaHU51Wbo6GIrAfvQx7VXBVdVVKVaKBgLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561939; c=relaxed/simple;
	bh=KyCpFVWIR0wTHD8X7nxriNwgwLgotJAeVNysqCrNQXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K81c6lthVR+SMY/udyFK/z8q10RRX5nO04mMvLgGtbRH/Ijtxdfa21sKYwFSrYlvhVe7uqri+NviagRVPpayVdrwz1aY4mfc0e7Hp3kDhiCt+nVqechmhp+KUYnaEaVViCXsGKmbFx/hWnabuDK0a7G+GNFxEyIvIlsu89TcM8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cksnLVa2; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cksnLVa2"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39d67a9ae5bso108923a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789561937; x=1790166737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pJDV4Cw67hspsaR/vUzqgbUI33DQmeDxdNAof5edoKY=;
        b=cksnLVa25DRgb3hGhVxxKYe3vOjCia9Si5W/O6g7eMcPH3IqL3kBYO+VMbSbHWtroW
         EaOx/HBfkr32GZ30ZTkp7PgWk5Q0PfR/fgU1CvHi//MGYTnFK4wzfibn75J4DPT5Ynr/
         tsfflDdoF4cPjfcIKMO3XfuX0BvhDOS8JS44imls7J+ySXDBb/RMsRj19wfHN+Lozs+z
         VjXXiWR7r540riVj0Mhu9/rxL163G8EDiPU76PIkOOx93fRCP6/orWoFgEjyFpIwE7Iw
         w5b6TTpq3XqPkiQj64qWwmtsAT/7r645ciU27rAW0eGn/mMoh5hMtzZIqriSYGWbW3A1
         KiAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789561937; x=1790166737;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pJDV4Cw67hspsaR/vUzqgbUI33DQmeDxdNAof5edoKY=;
        b=YWag66kT0fyUIeryjadvmqTj/JqVMBy0yVayUeWZQGdns3ftyt0bINHEWLw9UiTRwe
         bg2WWnmVgx1RdiA3gOCmUVDt+VKOqauHAJBtGY0UWXYQYqA/AB0xzP6cuDOKh4KfF4Hb
         +/TMjKFmHO6f5u7M8GjwH16dWOcYvkh/Mevk+uOjI1w0/kloD2eT+ZexFBaUXkkuL8/e
         LHO0ToKnrtpnbo8yIC7aqFfHk9BahqdAOaoEaz2C4kEcPhgPEL46jUGeEPaVRo7/qjtj
         qIoLG0qb9EHfKVOgn0ZbYT2xpUP18QeViPPmLxP/r/NaXH0os7g76G7C1iW4FiU0eTkI
         4kJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnm21jyzp/0NWWIZG/WzkUJBW+8X2BARpbVNbHI4wG0IuQTpCMXs9L4nggpnjxYPSkWONCFUQ7xVbfwCE=@vger.kernel.org
X-Gm-Message-State: AFuF++nghumoUMUAjf6NW81kN1fu4JlqnzCt3bpgY1VUI/xtIDsgfY90
	ZXfq1KHhFDBYCNemmUszyIbSmIRpvLUIaidC+fcsfZxgKzwIPH7omrvw9Z7Nhg==
X-Gm-Gg: AYBFou23k/TxChTO5bvl4g81BM68u1i8+Sr7+I4PMBaojoSjwj7gtmkgqUYcondIxBQ
	DOoXzUv81PinJD/eNrQkpdwaXh7MbNaWlnqWbfrL3R6+qonb0fuICjiqiRin0QAZt3G36ezQcxt
	Io75/puv8PIctm0MkndJ9NzU8jiBAu6fsN2QZLO7NgpH22nTeF6n4RbmfK8glSpH+s+5+dkSaw/
	ZMKrWXgo0udZx87dE4pO25dEhQ3Hg8Mt6kl5mfFYfCjkvBur4NsTrAzjg0KKOPouhxZWJm5RABr
	jq/0K3WrFgA7uHEPMFMZTHImASPsyF46zv93G8vx+oHIt3zffW8pdGN/fsk9raqE01mtusmJ3J4
	/PXNBC/UJdpgV0vkSqPPmJZo1/Ahpqso4IkvZ77JpwlYHSfU6PAsI1o2dXtDAzAWbly1wAKpw1b
	7UkKwadp9bxFKsMmTVPw3D5GNtnhbCnnzMU5GM5wjvnOXZBvBnY6d/0BrSQaVmCt8sRPgrCw==
X-Received: by 2002:a17:90a:d444:b0:38e:c140:2a0b with SMTP id 98e67ed59e1d1-39e1e4e2964mr3825626a91.3.1789561937354;
        Wed, 16 Sep 2026 05:32:17 -0700 (PDT)
Received: from elitemini ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b3dcf6dsm4778247a91.1.2026.09.16.05.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:32:16 -0700 (PDT)
Date: Wed, 16 Sep 2026 21:32:13 +0900
From: Masaharu Noguchi <nogunix@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Akira Yokosawa <akiyks@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Chen Miao <chenmiao.ku@gmail.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: report Sphinx/Docutils pairs that break PDF
 builds
Message-ID: <aqqLZTz6FAieAjbA@elitemini>
References: <20260915-docs-sphinx-pre-install-docutils-v3-1-95ee86793673@gmail.com>
 <87a4pi708v.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a4pi708v.fsf@trenco.lwn.net>

Hi,

> I'm sorry, but no.  This is a great deal of complexity to catch a
> single, hard-coded mismatch that will soon disappear into history.

Understood.  I'll drop it.

> Finally, this has the look of LLM-generated stuff; if so, you need to be
> adding Assisted-by tags to your patches.

Thank you for the pointer. I'll add it from here on.

Thank you for the reviews.

Thanks,
Masaharu
