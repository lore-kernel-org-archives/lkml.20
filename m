Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794609462;
	b=hKaDJcFimQVqCIWX9BaqPWLToRzVzpByHo6H96HHi5lXO6r4Irwhd5RATQO7zrJLi16p
	 Z8VTkEcU/9a9If3AIC1LNy0lz7NKzZmvwj/Bt0Z2OqChWkhmnqa9MBvlrYq0tQnuBmK/I
	 VVzCh1gKAhEQ2GJ6SqXFLV99jPB5JZYFz0bJn/D7Od6AG0UoYOW3Lxl55KySgfBCjur5c
	 eM392jjyAApcxcyrdsX+QsdEgvQzRerPhC1FUzOx4Dkf2Wi2JFqx36bXt1sdRJWbq9u5V
	 i9G8Cc6iIHFPNhqVtFgiSML6C4OPVfkH6kT+yVgEcv/KICFJ4CHXZORgeO8cwsG3Idg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794609462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=wLTGWrelj0c+idk0yjSFfSru2jjojEzphFxpTttWZi4=;
	b=eBTD2R1K56S20mhQW96wBIG9n6LJVgTOzL33F+pkkL6FIcu1BK7QXnq8kzyJcyoZGJON
	 rQeitFfRq2borD3mFK6hGJdeJWDZot1u8g2ZO3ZE6vJ2+lbXhrxrazP4o8YQ+bmkW1lX0
	 H8PUneILwBbtNqaFjNpPnIEF23YmO9dhfbqEqX45erw4Ml60Fr+OUaMlZmmV4Imu/2deD
	 q/F05y3D7Jg88ZzPA+C6GCuEkf5AnVfJuJapYEa3mA8rdmMaeiw5B5GZSzP40QxRmMGJv
	 fmJxLIRBJuZjRA84lMxQxIoQcgM3yTFwGNS1BnA7KFsnlN07/BCNPVaz3m6IakE+4lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f06gEVEp;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C96606A540
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05C96606A540
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f06gEVEp
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491971ac844so1636306f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794609460; x=1795214260; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wLTGWrelj0c+idk0yjSFfSru2jjojEzphFxpTttWZi4=;
        b=f06gEVEpf+nIUPLzxBn00CD8mQo78Sn4ieaSM83+IvSkhkebdmCp7jkfx3Tw6wk/SF
         ZsHnMWRDyCbgPtfQQaLEf+YjZ02KcCFawqZqR5uQyRtZ0Js6sBrLjQRYCTuavnTqN17z
         /zZXVF3mO3w706c7IMisnauLDaJR1fee9589GDBa3RnORJ7YT8IKlD40vHhkx7PI5FUp
         5pIgIUCQBEZ4uanEbIup7z9Xnjvja/CM2RUrUT3jKUFHAvA/moU2/iAmYicv1OQpDSmd
         cmioUi3Qu/pMYNA+/eZw3tagxA3pkIZKTciTs2fc04lFPTGNEvUpDz08qZZUQutQ2HQt
         PrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794609460; x=1795214260;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wLTGWrelj0c+idk0yjSFfSru2jjojEzphFxpTttWZi4=;
        b=B4cvdATfFDmWlVemnH/QoJyCGa61+nKTYC+fJgluebmIgfwSrx0TZxGL/yH8s11dha
         TKt5DDKYUzzSbG3wlsFp4IRjkBb9WkAy3ARY8JNpuRCPNe68agAsVZSLMcP9F2eRZJTL
         NPGCLSRhFxvyjSUX53Lt4yIsTmJ01pUHZMxhCcxJWiZYkukaHFSMSiMd62yOgngQ1wjj
         hk4QPFLNuyVDAnu6djlYwxNPR7IurWe1M5wDEjGmcRiuOtDU6h0kPcr97hzyiIuYc6lB
         ID24nesp4cLoQ7BbrNYHw1bW792zWNr6tD2/YchzlESTDOYFM9O8fEurehxuRTyR7i/e
         dPKA==
X-Forwarded-Encrypted: i=1; AL+hErEafGYp5qkkebCwVXGSKXVL3bPbEPI8Q8ptS7qLW3Tg6/tvymHCO6yTQHFLoxIWAiVbr3VZUGmApBi36lE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+638SvEJEIlJTes0T5fc3Vk4sbE8ILKq/DbvJxRiynGjXt2XpN
	7FlUqnPC0MwKvkBW/Y2rTvGguy8PbTZtiZrwFYNs+ElLy1GJsx5/53Y=
X-Gm-Gg: AYBFou0HBR4EEAfKFgtTUrOQoxGbSwVNsAurDl+2CjvHXW1n09g91DwTHuYk6cjk8Hb
	zDIHwmP6pPqc4PUiIpVA5ZAp0kXhukwlg2Jabh26g2nsh9vSEKnDbxG/qlH1SgloOUM4iJ7UpXT
	GSx4uSagZXvNNwfNTBRslcrn5/+jv0jcsthLWLxfOtLOgmdyB2rsACEWy2sSSKHjnI5EWYK4N8I
	A8TOW5YYcnr7fzTyJRuyO6fNzXZt2y6SSBuONLdfMv/Ql5e1Fn19Pqjt17afipgbej30FO28PqE
	Gz/4rmCBCACdCHwB74MbE7TJYvmvPcoaiAPwjHVlpdEbt9zJkDN2V97W4sBb9ciJn20ToWq4pcy
	wIMSunRHOYwBO/qsXecNXwCiwV3H7COdQPPEeQzN40wvSpJSlPOAYzy2wc3jq/l/b1OnanD9Xzh
	G1wQSG9ViZeApLMFGSIKqLCkIN08D5CfLbLNovnRdr1eqcXp+7mFdWaV6OcKbcqBqZIpl0TouC+
	CaOVHfZJGUtKOgZLAKpKfh7JAlgyebHJhh8kb5lgwi7YcNF++xnpTF2ebROwOv0skURgH0=
X-Received: by 2002:a05:6000:144d:b0:492:880f:494e with SMTP id ffacd0b85a97d-49c72c9c630mr9017132f8f.40.1794609460266;
        Fri, 13 Nov 2026 14:37:40 -0800 (PST)
Received: from debian ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm12122696f8f.44.2026.11.13.14.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 14:37:39 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: hverkuil+cisco@kernel.org
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
 nicolas.dufresne@collabora.com, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 media] media: v4l2-mem2mem: cancel job_work in v4l2_m2m_release
Date: Fri, 13 Nov 2026 22:37:39 -0000
Message-ID: <179460945963.2677875.8420657163527602501@gmail.com>
In-Reply-To: <a931e754-ab4e-42d8-8555-9a432fe42a1e@kernel.org>
References: <20261104014248.3761373-1-tristan@talencesecurity.com>
 <a931e754-ab4e-42d8-8555-9a432fe42a1e@kernel.org>
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

From: Tristan Madani <tristan@talencesecurity.com>

On Thu, 12 Nov 2026 at 08:38, Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
> This email differs from your gmail address. Which is correct?

tristan@talencesecurity.com is the correct one. I use tristmd@gmail.com
only as SMTP relay for sending.

Thanks,
Tristan
