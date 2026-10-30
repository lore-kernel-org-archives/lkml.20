Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349627;
	b=mDNSomb2jLmBwNHxRpsyPf2qyhODWXHndaBPqA0uMFoK5Aljq7vSfi3Fuss+NL9Et+ev
	 Tfpj9RIrnc87LMxb9kGlaE8seeu8eEhUVxdOMKh2o7p7HdTq/ECw72cIOVL4nnr22JxFH
	 hOvSEvCF1edUcsYQTID7/baeV0OKz11SJAyqG6mFZ3SEMkYSSx3Kc+rgZzEX8rU/SBAGU
	 hhp+ZABmfkDrNIWlh7UJlk2zyGJSRv0E4tKmGpZzXTtAP/S0hBL43/wuALS0v9Fjrwuv7
	 WzDuwaNPY7QzzDtm8pNf2olarI8F2KfO6wQdL2bMfBFMfWXNd0b7s7TdwAiWxAVaZlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=p2lbErXysC5keIICd/9Oecm+satsW+gqAIlkh7mZJ8M=;
	b=b7hF/7lpjRT1JF7de9x4T4DKrs8QtQCroOIOmVeeIVG+mP13escAedFYo1X5KcCvQKPa
	 DvX896TxbDBp+PP56vaY/zfxEUIeWm9BtLWjxNJYyxNv3U4wJb4f1ROHzb8W288fT7KXl
	 pwHQmKKC6Zp/1aXglmoNM6tFHkFjBEfnuH+cg5cJZX7vukduOs4V5OS6p9kv+YNO7kAFa
	 bOyIUNhBO0Cudm24hIEozz9VxuGgYKAUcv/7BEYIDKChgwxbN5pgAhzj1FAO916z8tSbx
	 ox3FCEmKaSN0GIY0c18HlTrVGRd/BtvReFtCp147wXdGYW9lCbqCWWGpxzYxQzonsJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hwGefDb1;
	arc=none smtp.remote-ip=74.125.228.6
Received: from mail-pz2-f6.google.com (mail-pz2-f6.google.com [74.125.228.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7FA606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC7FA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hwGefDb1
Received: by mail-pz2-f6.google.com with SMTP id 41be03b00d2f7-cd8b58dd4c1so7861a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793349626; x=1793954426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p2lbErXysC5keIICd/9Oecm+satsW+gqAIlkh7mZJ8M=;
        b=hwGefDb1SWctrOe6SQdKvltFiVhjCBvK4nzZjKCLo7KEWh0S1Zef9SO464ErUQOnLK
         8FjZ1sDDtHIsonQIgKxdTbLw4uIwlQi2nGAu4hwzz932I4/O5msW4V89rV0kqfPaLFRU
         ZOMZ4hAF3PZ+bdVnT6jOMAnlLN0O6O2bNyLkCE38yNOTsQb+5ERP3XhcxZTbgSh8SEzT
         /gGQsfwAVL7tr+QOnNY7VjxbAkKIfyvzEwF8oaJytuHFBdkInK5U+5Jg6sYYnc4Yqwjo
         jNeC6Qp9fJRlf3KL++vTrCllFwypFsOFxMglcQOeCJww6ajRJy0ioYfNOuXNSBojxPhi
         gQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349626; x=1793954426;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p2lbErXysC5keIICd/9Oecm+satsW+gqAIlkh7mZJ8M=;
        b=f4HEcKeu7sWPegBM65SRrROH/Q514CSrSWu2Ic5shytDL0QXWDXu2NkvUOf51fyyJ/
         eyzRn4IItoVMJ2Y80QZyNiQI2KWSI6dpTEdngH/UP3I1hJmEAK3F+PybZaAP3a+dU+UT
         gKsEoQL6En4Ua0DQWc5cHiQl9cXiRcjFpWNQ9w8xZAoYop9DxUZklb5CDJ7K/syXhgv8
         HS7LGf+0pVihzy7WDOiKYHy10Bqrc58CtEijiGQ+MW2fkWSl5BYkqA+m6de/F5OQElaj
         NTJVJKcKIJ52AqU/9i32Ow9F82MJkazyfYoF7MscotqTag7N4irPjOau8cG6k2579JEk
         pH6A==
X-Forwarded-Encrypted: i=1; AKwUvBwYBKOJXzq89DlROk3cMRXNtPi5VbHZPN2kTU4NNbxL4gY+ul7YSO+wLBUfyRh66vRQYwhxrdn6zgs74I4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJebacQfOHXjiYIcA9X4pUrk3byA/dGrSMgkCEe8RJDMp1X4tbI
	Tl6tRQZL3veoRQ6f6R52X8k+K9HVRnSTSVS7qsl3xYe+UlXybPlrTHhy
X-Gm-Gg: AYBFou2ipS3C9w08KUN4lfciWmurZTQamjNPPnbtfeFcupaWZdfgcc0oPowbLntUSer
	LTBCH63B/Nj1CUGMzvphvlQN7XUg3Hdei5STRhpJiP6SoOTuBfwuLVsiYKDBz9M4HCkXp6vIwGb
	2LE76MVzexjEUCZlgdpIjsECVTPTiJv2C7uAg4SmPRSgb6gg6SeJLv+j6bDjMHQ/fcaga0gbZup
	8R4/F2mhNiQdBNYVWhzJOHG5So/lj05MTcbQTa4g81Gblht75B2x0rm8zsnjetyHug+Bn1bWkW6
	zzje/xVKiQA/X107myD6Gg4N0b7H0xUXKRTbAGpkqJPDXfQuea6w6krAk3z1XMv/jcxtgh+6Pg4
	MTtEMzENOPFOsBHEk0VOkmJNdFnvpljyDGM3EKMZH3Eva7XYbGgo4QMjVx0QdfvfH46pEw+u9Lv
	bEnAers1k3jePgP0bUGg7FkaHdyiKLHFJ0UjOmSY2vpeTlwFvqLyEXc9RiXhD/H2RdUMIHLOQ8K
	1FbZP8TS26FqctgqFpZfl8JXgBgE4OYcdWQMJtqAHiFc/MkQMjBP9kiWGS4Qj71wfKP/v4NV8+Y
	zMsoNArSO3raltHnMv/C6Q3h+ooybW/Wv98obFOxsK4Eljvlo/3rWsGrGGQf5G4=
X-Received: by 2002:a05:6a20:2586:b0:3e1:9071:acb2 with SMTP id adf61e73a8af0-3e928a0b0bbmr1315570637.33.1793349626005;
        Fri, 30 Oct 2026 01:40:26 -0700 (PDT)
Received: from localhost.localdomain ([240e:46d:2600:2f3f:1d83:9185:c6a1:9ca1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9eef96e53sm486051b3a.20.2026.10.30.01.40.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 01:40:25 -0700 (PDT)
From: Rongzheng Wang <testwrzwrz@gmail.com>
To: Jason Xing <kerneljasonxing@gmail.com>
Cc: netdev@vger.kernel.org,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	stable@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4 1/2] xsk: defer software checksum until the skb is complete
Date: Fri, 30 Oct 2026 16:40:17 +0800
Message-Id: <20261030084017.16202-1-testwrzwrz@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <CAL+tcoDUGqk-KfMBqdG4RBURHQc=9J+Ce7B7CZZWRN5yN7pRrw@mail.gmail.com>
References: <20261030023248.78802-1-testwrzwrz@gmail.com> <20261030023248.78802-2-testwrzwrz@gmail.com> <CAL+tcoDUGqk-KfMBqdG4RBURHQc=9J+Ce7B7CZZWRN5yN7pRrw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jason,

Thanks for the review. This was a timing race, not intentional: your v3
reply (the Reviewed-by plus the else-branch nit) arrived at 10:30, while
v4 was sent at 10:32 and had already been prepared without it. I should
have checked the thread before sending.

I'll send a v5 as a new thread with the unnecessary else removed, exactly
as you suggested, and your Reviewed-by carried on patch 1. Patch 2 is
unchanged.

Thanks,
Rongzheng
