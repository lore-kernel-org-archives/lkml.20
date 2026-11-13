Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582952;
	b=XZUvRXsAdZjFJx30kgCyHVRlGvYgYTplyd0bYwWmjON6KsmhYKqQO7naVZq+s1l5Bxhi
	 y8ONcTOx/FvkuC/qBuDj4oPuM0bYRL7XtrOQWLHkjap+X+hQ7ZWYHk6wP8yPGtQdjVt/x
	 WYnnqBrmd+WSGtLjEYM7DPN0JMFiyxtUuepxG1M/wLDBBSDQ1+qVL5gU8utWdPRIlj1qw
	 bC0IzFo18GSib3WLORl7GXMAsAyY0xAjyDMQz/rPYrJauMKWdpFrkCuQRQHqqSR9M83/p
	 o/8dWicKZC7Q5dSnvpt9T2Wq10s92XE3/o5clGYohBvWlTRiHnfhnwVoGdgfFFHsAOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=G4x9g3bqlTZt05G4xvm5t1Rd2JsR04WKB6UrLcml+cw=;
	b=Vofk1a9qNWzq06zcDQnG1KnhQwvchExFbeVSWobVVCG4AjNgH9d7KHogWNZB8fGpGp0O
	 dVwsOTA3Sc/x/wHMtgQih6Co7nr8RCtUNkNsDq6hLzl8aWJLIuusNag6ENYtqVkn9KoF4
	 FGp8U0N8XzTgup3N/MO/OMdzwXrRHocwsAzizvWP4F+4CahRuTw6VYsc4oh6HDD3VCWBr
	 ukf3mhBWveuRzsKKT1kEh1o2pmKzJ2wxpDpkE3gAU+CvxKdbaeJVe9FjLGQxZ7E/LGCLj
	 ATZFyYmwcUgN8EJCyyb6dfm1pK34GwDtt9wdhUDQT84blaZ/Nzc9Gnc6AI1qfrWs+8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YK37+uqO;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAD5606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AAD5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YK37+uqO
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so16724675e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794582950; x=1795187750; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G4x9g3bqlTZt05G4xvm5t1Rd2JsR04WKB6UrLcml+cw=;
        b=YK37+uqOIExWt6SEWEpNPNJi1YLCKu29di/qyfZKUEYBz3CWhdwJlkttYPW+Mq6DKn
         7UBFA3Oyo4yaCQ3V2ccqGJ9Iq7IvQk47WL45MAkOheXuvPrjmSVrupIiHS+Wufls7MpV
         ZbowRGChbGgbZxy2IHzig8u8hk30TVJldWTpCXOQQSMQghSUqwYWTmd0UIzDFfw+GgnC
         khg1U3qiQ728D03f7VfQRizVVarpVgeGXA1prFs1v3KmHF7qs4R5tieQS03B5zmh3Zkt
         no2wx1T4hf8I2NTZ9UuB5DOpqMGUSd1MI3al6D8P5o3wAdiz4MtziK64BFV76M0+HfJX
         Jbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582950; x=1795187750;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G4x9g3bqlTZt05G4xvm5t1Rd2JsR04WKB6UrLcml+cw=;
        b=cN4cDKtiFP0bBFUcZXhYFSKHF4wjM0tDvJC2PgGtCCAY6uWFjy+q4NpIof1tiiw13H
         lQgzhWm8TZsGlI30DABseZvLizT6pBC+VPemgmlFJtMtFY4kixyuX94qmX0LSp3tp644
         toGqCer/ui0l606HeQ8/vFV8+cX+sURBL2ojYyvDAr+3tDaTrtzhOYnxIlDeH5Cz3PKx
         ksI5W9zxi8E6b3ZoIXVTnB8cPfsJ/OVwDhZdPsxF4IsdcjAlhCGpZbqqU3BDZrdwkGDv
         tB/tVZTbEOpyrJwfuWj+LBJtao1vO7SuhCICvDAqIq78oidrwQ9y/5+byVs9f1qGXDYe
         UBfw==
X-Forwarded-Encrypted: i=1; AL+hErG576smAbUXQlxOHnx6K+/nPp2/8/PCm2PshW79Phb864tExn/VWT+IOALBxGepivWGvvLprsteO+n6Rj4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+Q0rcKwR43toV9n41FlvPj+QCBnXmmMU25sdq+oJrmqVtkDbb
	/n5WPKGOGUM9/QQuxWefBrwSIl8Epjg5LbMf9M/dIIHI9zguc6vg2w9E
X-Gm-Gg: AYBFou3PPJRwpATeyDKzwdsTlWl05J0SlmKrUGYp/PV4O0Ro6DEon+LaRUeu05QaZla
	zU1j6V/yyZ4h4lCzuNvbHVuJGk9Rbi8vRu24q+qT6rW+HWhTMCvQW40h9PXdaultkcAofAeUc4Q
	PVmt889gALwtt1uslyl4TfVJZr61D9Qqz4QlQK+6RiHSrDxYeBSKWhLMFt2SabSygzd4Zz76mGi
	5zqzowYlrvcnJVjXXgtZsJBnDBbUVq5luldy98znXwGX7XhhjE7gm5wF1+L/dNgjBjZZFJCRPko
	JmrOMp6IOUx0OXpu0aaKKYKI/DQWPidD0kyqGfH+AYasiHuBKMUOZHV8KA5Itrjwx3Yrjne3D/3
	absJOuWg/e+kuAnTmxaN/DbrMgPpnUOo41u2ARKrapjfRa/wZcz4OAUaGhmlxJyCWcMBY95p0iq
	ygYhuae+3gnMF19YnTInLAI5lebT1+J0ZduoDNTmjjR1F0tnd0ykg4o1zKxNlxGV+FwPgE4E/7o
	w68hbl3LGb8suExtnfqjRSCERorprER/DAuGlDS1Jirok/rex8fiFx7sY0ffHPVaMgGhiQ/GWux
	YbiopnIsQoLaGDkI3cg3FBgvMGbU8hAOzMk0vhi6lKuhY0CsctjZmA==
X-Received: by 2002:a05:6000:2084:b0:492:46e:d4ce with SMTP id ffacd0b85a97d-49c6fd932c8mr5563052f8f.13.1794582949657;
        Fri, 13 Nov 2026 07:15:49 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2be55sm5971522f8f.28.2026.11.13.07.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:15:49 -0800 (PST)
Date: Fri, 13 Nov 2026 16:15:44 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Konstantin Meskhidze <konstantin.meskhidze@huawei.com>,
	Shuah Khan <shuah@kernel.org>, Dwi Siswanto <me@dw1.io>,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] landlock: Fix layer composition of
 LANDLOCK_ACCESS_FS_REFER
Message-ID: <20261113.a61c6a4b7c9f@gnoack.org>
References: <20261108-b4-landlock-refer-nonfs-layer-v2-0-2b405fc1b3aa@gmail.com>
 <20261108-b4-landlock-refer-nonfs-layer-v2-1-2b405fc1b3aa@gmail.com>
 <20261113.hij1gi7Ees1A@digikod.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261113.hij1gi7Ees1A@digikod.net>

On Fri, Nov 13, 2026 at 12:25:07AM +0100, Mickaël Salaün wrote:
> Good. Please add erratum 5 in this patch with abi-4.h .

Done, will send that with V3.

–Günther
