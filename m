Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353603;
	b=2ThE+JjDsHX5BHkbvjfsk9gfEX2HzyVkUpXdlnzQWWsCgkimgIYew76BzoMUPV1fpfSq
	 rEQw33fJPx2zHPdDl/c17rN/nuIArGVdHtUoX8mX9+ZPgPBKoKBM1X4EnyO2rJrWRr54B
	 URDIvnlyZLN4n6zR5JPl3rIz7c6Kl7TkBYiAfzdp6HUEKMW7Gd/bKCNGo4Hf181VNkZCX
	 HlZ3LUwHXc9fC+VZxNwAvgUCs3aQcj4DaYkXVzfxkZfWL2iwtCSKonFSZJTJltQ1C5CSt
	 v4aVeInFkAicm4x/l6hx3BmQoCPWoLCLYG0Kz52sDS7df/9ddWLtiOoSKoZbR6ktuxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=IOz4ue54IuUUiPM1zk33V1FdxBfzHmxJTDRmhyQa7XU=;
	b=bHxubpEabvAKv4K9jbeTI1lUX5AnZxGqCs6Vb4AERUENDjmBcS5AGESisjjl2QAdykVn
	 6UvBunHjW+B8iTDpXUc1Y4ZgYr3w3PFFLJ3ZFO7UR8CF+jam+/IBgQe/WgtMlV7AtJIXa
	 DaErV0dkVamd9rxi0q1WSRJJXDIFHrK5bdghzvshpj++pnryYpnU5+yPA5iF7CSq161m+
	 UjvT6FCDpOjgIYcoNEKpbU/bnmVcHzAjp/d9IaaEIJ/yJcxEylS82I0Lq8NUlcQpn2UES
	 JI+aPb20vGynMSEq1rNDJmxDf7L5JmGXxthD56vHt3oVoGWnhJXk6978l35bXA6t90w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0kQNarSx;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A3E606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9A3E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0kQNarSx
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2e651c30dcbso2873525ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793353602; x=1793958402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IOz4ue54IuUUiPM1zk33V1FdxBfzHmxJTDRmhyQa7XU=;
        b=0kQNarSxZeE3Cgu1GV71IQdek42/dUZi3/owzf5Vhn4qSxRd1DyUIgfdlVEZ4HBb/C
         VYM32ZLAbj4dljoJS/GPhetwNEkkYloNNXA9XdW28TQUKhX4pJl2aOPcutJ2jPZWxPZJ
         mA6uT/BkIi0JbMbAHv7iJAMvQWG2CgRcaYFqne5jC4z/7mQcojmPslt2/MvEyFG43Sgv
         uWg7TF056NBGJI33kAGa0OSnk5APUaPUzs5z0ECZD5fukdrTttMeZCjrH5IQ1zNCrBjj
         B4R1XvC2/XOhfJiEEGil+7LysefNDT2yzXI9kEBdXd4K2FOw+x+AqPbqaPAPhvfMbWNl
         bN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353602; x=1793958402;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IOz4ue54IuUUiPM1zk33V1FdxBfzHmxJTDRmhyQa7XU=;
        b=mOqb7qZazhxndb34pQfCjz0eiQvPIIQ+dpww8mz/LKT9SWUorY2o8YVj/xsmnu1/yt
         1QnGczNV0Ij4VwFhew1VdCkTtPYaJxMFjc9rBL9wMtyOB0zno/b7fqcRgGEJw0nSebSM
         fY4F1l1GmjYj0vmwuNPN94MX0w8DFFqcu3uEtXdJ5CPardaPFMw9T4OScwcDuXJvHOZf
         +b7ja45mTPoL4PsKO3ci3pjhduqbM89i3EaUn46a4bR7g/L6akhhV9QQAAMklZc5J+DV
         CpR3oTKskr+vMq+bXoWTzg3YYnH+RWOgoSWjwwj7nAgcobDrYGraHc79UMXb1Pv9VKLj
         6vBg==
X-Forwarded-Encrypted: i=1; AKwUvBy1Sdfk9OPWOSvLmMi13OSzD88bT62YczTgfjbOwGHymnv/F6HnIjqY+JbBSWJ1wBQC6uHkPfCxmzKn6hM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkNeEqY/gYwjovjyIM1fdP4d/EAr5cyIUd5ah7uxbokJVrKM63
	yoZg05QMbGyPuciOJgSO0fxA6DkafA8XKyk409lz1doH6IGDQ3683XUTJqo9TT1/uO4EhQ==
X-Gm-Gg: AYBFou1M4384MtEzS+TJqGIb/zM4XAMJJ2ChNBAcWmP76Ue8ONIvwF9XZaRY82vE5RA
	5uh0ldM2cBth4nnS4eh99xLxkTxMZQFDwf+ffX3isDQDLhPx4soVRz81eTE6HS/yn5GXLf/vzi+
	ozZCjFNyo+u0MM+MXvo1/8V0FCoxG/gqMJSI8xIkdAsHmfptorrBqWdu6tmoKHZNDOP9OOi1HnU
	S6N9Bm1cy4X8UMbXC4uplNm2Kn+lXY+tzQmHj3AG+01r91iB1NoER3S3Jt/gts69jLL0C7wHrqz
	YfTIlNVttu0wHWAxrikq5k0RtPVVDd7uv5k7y89FPVFk1lm1hTC0TDaJwxL9SV8xPlj879+OwLy
	oyESNYffFsnnD4B95fVBIAT93oS38y8PV2kqHqvhh716e8x5WFqoq4aD6yZuNmIHgVDVpC7sLR/
	Nrr5+Dzk1AeyrIFflOGYV/nqF5Ki2Ekks7RJhVeWrs56iLoeyEceWvaXn0PN0Ui+qwIpSSPHxPM
	mekCh6GYNXBHOjUZsUmxMGa5msgUeMiqYh9eLd2baum8zMmPzVQHhqlFY5BKtdtWJbL+P7VrZWp
	5gFAHT7f+vG1uTuJKeYO7fH9QdTCF1VKMcuJlkPDFWcrnubQeYpnkQCjKDgIvK0=
X-Received: by 2002:a17:902:ef03:b0:2e9:460e:ca49 with SMTP id d9443c01a7336-2eb3649be5bmr20449825ad.18.1793353602042;
        Fri, 30 Oct 2026 02:46:42 -0700 (PDT)
Received: from localhost.localdomain ([240e:46d:2600:2f3f:68c5:29e3:ffaa:7181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392aa7bcsm4998055ad.67.2026.10.30.02.46.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 02:46:41 -0700 (PDT)
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
Date: Fri, 30 Oct 2026 17:46:33 +0800
Message-Id: <20261030094633.27910-1-testwrzwrz@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <CAL+tcoBThTe7299eVU=tsUdi392dS9cioXX5RA5AKRsYAGbdVg@mail.gmail.com>
References: <20261030023248.78802-1-testwrzwrz@gmail.com> <20261030023248.78802-2-testwrzwrz@gmail.com> <CAL+tcoDUGqk-KfMBqdG4RBURHQc=9J+Ce7B7CZZWRN5yN7pRrw@mail.gmail.com> <20261030084017.16202-1-testwrzwrz@gmail.com> <CAL+tcoBThTe7299eVU=tsUdi392dS9cioXX5RA5AKRsYAGbdVg@mail.gmail.com>
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

Makes sense, thanks. I'll wait for their feedback on the selftest patch
before sending v5, and fold it in together with the rest.

Thanks,
Rongzheng
