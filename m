Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908715;
	b=y8srv69y3+zWwZknMd4UnLjUr0++/Z+LbMYdAy5783nBggeL5BbbRCa7OqLxxFWcPBPc
	 oN/4FNnGke+cR5XxywvE0JOIK568OXon61Kd89E5wz/Fwe9kNenZ2G001S6imGTCPZ6gm
	 1p19+qyIxwDogTzEQt1nWu/ReUz8IGhr3+JHyUpKHkikJPdmrDBBwin29dYxsGv7rAqBE
	 6VU6BojKNBzP3K6BOjLSG2eQOjYFFdlA1dcE842RbY0wpkKUM/LEUFuubvnyaoXH4JCTT
	 QmU8G+viWZxI8EuF86zsPcqnBm3wxCAZIM/hMN7ZmUAQr9U3bb3hbPsqBYLpVyHq0GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1ed75Hee6/Nq2z05JNxnecL8gFy96FZ1Y4WddieMGu0=;
	b=3+gWZ2+zlx3n5Ltwi9adx7Oe08FhoQODOTKLFOXlRFvzIO59m8IXU0atRFGMAMaBSN02
	 w+T78qjif+QxscVCkcftYwbqUuUfzuPB2Nt5UhnZ8atoAApZsp8Ep871C0AD71idJhxbS
	 142BIgZFUIKoRP9tBLeZc3cELJs75HPQhJPw5DUgS9f4N7+7RRRt98/4KwAgbXbcb7SpI
	 ON4CQRi7g8dS5luX/fTw5w7SbkxeU6YqHYzSzd/tPg4pWeknGGN1Tzsx/J64nWq8+uk7Z
	 EbITfWsUIQqkOUagHmQcTmyyz6oxBrjyaZPUS8utIBUGub81OPJjHOaNJVHl/tOGIyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vt9LoZT8;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBC0606A338
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CBC0606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vt9LoZT8
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e47347279so2154832f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794908713; x=1795513513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ed75Hee6/Nq2z05JNxnecL8gFy96FZ1Y4WddieMGu0=;
        b=Vt9LoZT8JVBNJWGqUF7+f7t6Dw7NR7F4RsK//7sdcQLDNA8Vgr2TPlZZ893Vi+698v
         GIIchLspIxslQTf3LxSY70otakMjQjLFSgFKLKlWobxHc4d9B+D8Zwopu/4XC+w5uDTy
         ACAXX8Qdc1RM1nqXs4NsmlX3R6VpWy+X9O4gq6Uf3V1hm9SOetCSoK5HjGizgfbA76er
         KZ2xT+U8IsrCACRbVu4vyBCYnA4rYbcwDPaUVOKrpCV9PfdSNFwC7sC0MPArbL4PPGlo
         wfJGb5lukc4RRtm+wTKBrGJAdwgQzM0orPIloCxpOXuT95NjCb+PnXaeAPVT+R/rQWwo
         +a5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794908713; x=1795513513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ed75Hee6/Nq2z05JNxnecL8gFy96FZ1Y4WddieMGu0=;
        b=bcNLCJO5xcGnDgqz37tbb9F+G1WY0Ha6AZgUd+4Ev8Hf8dq4StwPn3F7dAAF1ALGcR
         yWFP1wEyVM8y5fWXBzuXjWaZUeLhGMe+jpxV59hpjKbHL2GskawgHrExrgqsNprtCMtN
         rVUNP2+hOp1YTsMortaaoI+GE/TcJ25k1byHK83K17TE+0Nwxl7DFKj5vytk9bsO4nJe
         BGw1Q66Tk7DhfKKfUejLob7xG1a0omDrcd+argX3dGaUMETrCO2NLHSn0UiD6Xus/R0A
         utAJKIjXo+1bbHZH5eZXvrLJ7sevD2IgMco5TINEO3Gp4Ot44EYlMD7oFOcrO7mp9gQW
         UFnw==
X-Forwarded-Encrypted: i=1; AL+hErFN3iGfc8m2WbRWWPNGYABLgVDa8aUa45+Yy4S68dqoYHQf0RpnOuNZqITtwHp5evRE9+4lYupVCLSbzAA=@vger.kernel.org
X-Gm-Message-State: APuU4Z96/vvg/bzdT8zVHDjfP+89pk3z8mD7XFnKoc4TgmQBOqQTzwZR
	SEXupAi1O+0QTJ/YRbkp/QVrn+8mI6PSsCXm4+xfK19ArEUMCFhUGS9Y
X-Gm-Gg: AZFdTZfueKUejjJiDE7tbUv/7yXlYhy0+MZcUK9AzoRQv8Sfi39OlGTtjr0lfIXukhU
	fzDiyZ25JD/RDUc6u3z4xDE9ljb2YTLwt2AaOMj+uBrDBK/baZK6dq/u6kSWLkuhI+qKZCfoirI
	5JK5+cFR2gmnfwmnRnL9z/hIO6AD+onfCZ+H3dE3azylDtIQfal/kjZCJgerpSSyPaFRid5D1v9
	eEfG1zmVpIsDIK9/ufbxTOHMjVgMap5HSJjNv7JxNr18BrKoQx1fP+xNDbQSmb42XTKvaXnLNPq
	Pn/d2COkCBAwby7Gvdwcggse6U2Y+MM9jD/yrHZQ91vEVf/RB9pYp4x5hf/iBy3fm6CWCwVlJB4
	PGiA1y6L7blJbUFdMXZRgv1sU1daZAjQJk+mQLiYJJ1jODP56Z97Jb4VEi9ODIFHfMMxZaUTo8J
	i6tHVOy4k/KWBX0peYI8CXEmZb/f6W53f3aEB/7Qmga8YLR2Sai19Tkil1i4Gb/m41tz+A8QSsb
	bGykAlGp2V8ggM5GjlCUsXI1/bdu49VBUVtHhG8I1CyctVbPTnMOGfzISO5Yqrkd84Fx/M8I+E4
	/jhBxUw6TFYj3dDLP/fMom5tzFvZU474bLQ=
X-Received: by 2002:a05:6000:4707:b0:48e:17d1:16c9 with SMTP id ffacd0b85a97d-49c729bb45dmr27372345f8f.40.1794908713252;
        Tue, 17 Nov 2026 01:45:13 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c77393700sm26969698f8f.18.2026.11.17.01.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:45:12 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next] wifi: rtw88: program the beacon interval
Date: Tue, 17 Nov 2026 10:45:11 +0100
Message-ID: <20261117094511.1677990-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <3bd4a36de66948618d80e2e6d138aefb@realtek.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ping-Ke,

> Please white list of vif.
>
> As commit message, here should be vif->type == NL80211_IFTYPE_AP.
> The rtw88 can also support NL80211_IFTYPE_ADHOC, so you can add it as well
> if you want.

Sure, v2 will check for NL80211_IFTYPE_AP and NL80211_IFTYPE_ADHOC.

Mehmet
