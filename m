Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793390580;
	b=kJ9rVAwxZJtNr7lknRQiWSc0dn4drDDFzYnXZYqyswOQgtzGb01xsuNNn8AaumHOkas9
	 NJs9yaZI+CzFIPpn+862zj3NrC97c85Eef0E6ou8agfnfbm1aDigVgX9Z8ofH4OgMOXZM
	 +iGrxvGeAcDFE1GQ0a2Vxe+LvD0uEc9zX1+YChcwYYjhXMrmYjrbAUB6nXUR+Kt+AV/Fz
	 M7gT2//6zJ1wRux1veIaq+gbVtpB6c0jiFDBCiwAqGNthg7JO6cSJff70GmJDyKqtkpLK
	 fkoAEl7Q3on6tt0qsTF1f7VN4aoIVWqByMnis90kp4VTURqhqMJHGfdBL79qGlw/xVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793390580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nbenqoNggPOGuK4qGvw8vJitQbUecGnq+5smM7bEIBU=;
	b=ntmRjHz8v/nR1RmDU8XkZqXRBvnnZq0DuOugsTQXbWahU5kB7nPQ5DhdlXWCNN136iT7
	 /CjcKuMUZY+J5oc6TdPq6y8e1sDTt6mkZ394RmdsApApZPdu3DbpaFczuySYyn54jfxX9
	 mxn90r7RLiFe1WxO7Tk47gJnB3EHg4Am8MQ1eqrkorzJTK1g++Brlu9D4j8kxNxpaucCM
	 Eei4Um+1bBgokHMWciQuSpBYAT/XKYtdztMBA3AhSK06DReRCdyZf1aRSy5KQfNVrQqbe
	 /JHRcWjuo0Vfjk5s+IjQd0YH58TakZFkiO0Z7b+HyiQ/SF5mCSTovNyOZu//UJ9i9Dw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=su5zxmIv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66EC606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A66EC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=su5zxmIv
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so551692a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:02:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793390579; cv=none;
        d=google.com; s=arc-20260327;
        b=J2c1T68IgYUkCIlVYmJ1jJIf18Jl9L34neENxrCmFAtfsfHTd3utDpaNhMQw55JJsi
         zWzA3ro2iHYGoT7BPrVmCM4CFk95wuqN/hwtT5ubGg+33aX6uWSAEYvBnyk+DRcY49Vz
         eEGzPzmHIqAvnwe8bHOM8TrXkdmqTh8wKzyWCr8+D+rRqQ/h8g6+RnPmjOrOZdrSMKTF
         rUbSU/agm7DqFxgv2fx0NzM6q7ujxAgb89K+XYpdsq76ILFx3oDuntk5r/iXy9mlQZtO
         Hj1/aOuCAHcydutju8r5qgCgiFe4H2RjUUjzR15NwhM1skPpDEDNzLgbksYw5HtFj5RB
         ZhJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nbenqoNggPOGuK4qGvw8vJitQbUecGnq+5smM7bEIBU=;
        fh=RxGZGyquJVRbII0+wSnk05UdSCIb2DQoh7vcAAKFmKY=;
        b=JWs708//GwRmMNpkQw0IjEzG3893ADUsAegIMU9k/wxX8+F+eONxaZ+jRpuU7yAKqz
         cS04zz+pvHflkdFvHRvGO3oAhJ+iRiI4fHSKiiHF1rnB7vWK533sA+10AG0S/tnFjxjw
         svmX8EORe1S09SrBL/WU3r2Uy68N1v/u5F0y6k7+J4AhEDIwafk2T6RnEBAGgw8Dsnpe
         aQ69lOzaENrHaROtqEsoTjeD9qBL17wUqYZFrq1TApMg9K7rGb3WEKPx5sy5oPJ4hxDu
         ASIjaNPT4MCf6aGHoe1fF3gIxkOryT9m1Gr0IbaIosFRUjhZ+59rzpPgSGQSiy8U5W5A
         fNTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793390579; x=1793995379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nbenqoNggPOGuK4qGvw8vJitQbUecGnq+5smM7bEIBU=;
        b=su5zxmIvmu1AjjCLpDSFUAIU7fLZKX0xQjfo/8LkAIGqgh3yzGqpVNlJ7400H6svzu
         VpjRXuQNDAIyEPlg2PnktHdejMIWrS8g3XeKyH40w1xordt93xlqFQy1LUv+UAh4cjL1
         THMHfWjqy6PMSxNjqoIhWng1w/URUEsER/4TOVU473LDiVYxIGBk/zFOIlHUywFpIace
         241TNf8fEUetetwteFjVNEPigRclBYld9zUAH7d/uCFE5dzanoDcpjnPMYmQiGGGX6RX
         qMQeIcDbVZSNdQhGve430T0bLiK2bPeHPqGPqiyVWasIVEDr3hnkp4kpRLWw+dzLKf8X
         klgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793390579; x=1793995379;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nbenqoNggPOGuK4qGvw8vJitQbUecGnq+5smM7bEIBU=;
        b=DRxKv3IFhM4NcB1dfTpwmg68Mc5oifI31Vdt4rihRWYcq6AqYk4ntzKBnlEAOT2VaC
         8BAsRHAsLFplpEbXectERVFzpOKj1HLjMERagg7RLn4bCSABmZ+hGwv8XuEeqPZhqXQy
         qPV4U+pfV0i5hZc0dS789w5491kACF1nh7imQKYxm8GWBxeOUWPM/qrvTk6GX54rr40F
         1aCOY5lPBhKPI4NdnidxqtLaa8hV2npIOHNG6QBilNA2vwv5MDr+tJuBf1GK3Wk6w7sj
         u26zkOV3pFoY9n41QTCJuKBPAWRvA7i41FkqW84mh9nXQCzldd7VeO3eCV6p35XqfEJB
         WDfw==
X-Forwarded-Encrypted: i=1; AKwUvBw5VU6C9I58S+mpl8quPO99Mw6qJ/6rEUcbz5ukciBroVm7YOnf4P0i9sqrdE5tAcTk5tTtyANyWRkNFTY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9G4Cd2WDWoxl+T/MmbpoLOEfm3tTrLQ87zGTkNFmx7OLDoFqi
	cxb7ozVpRHL3vHt6AFHXFvbgsDfJOCUeDSr57pqxHrCRuhuVHRdF7mlaLGYxDMuTVC8wl7bDVkD
	hZo52Z0JMD/hbNO3Cvg8ZlBNsGW3TCtg=
X-Gm-Gg: AYBFou2u/Zrl+Cc+XsB+KG/B05V/LNxdrZ6DmqnKpAZlDseSJUci11EKk40gPIHbzXj
	NWWLMtTTMzbW8e53FEzGmhvd62sfYXIBOjixJkxr5cA9TgzpHMgKbZinrr0o70VkZ2PAkxYuLcN
	2h7aP98/rB/s84UnuaD8W1Y6WoqCxzaAfC4kAmzkNQ41IJuc/SQG6FZwiXT98cQ+eomsswulY55
	gMp5N82bB9nDh82TF5HIr7C6duyEMz+RNR6QIhgVYxUugi5swOsLfgTWGxD2ZXBDA3FvQ2L54HY
	ibFtHzy2Ij0fyCL/aiObMkffMu+p9GhcBFfwBQslKTCkRXZqCk5oqtXYQ19Jsw3KTZ3r9AKVvoK
	KxxqxdetN2pK1xjK11vV+FC3lVKdNehA4c3JWEgqnqZVGwmOlVsRGI9RleGqDqnXaVFaF4YQHNd
	Tx5Z/izlrv2cVxheNC1rWcuEPwmk9q/HM7Qg==
X-Received: by 2002:a17:90b:5807:b0:3ab:be66:ddbf with SMTP id
 98e67ed59e1d1-3ae8981dd4dmr2709491a91.54.1793390579014; Fri, 30 Oct 2026
 13:02:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030090913.76944-1-dennylin0707@gmail.com>
 <CAEf4BzaMDRa8xD1oR587P82MYKCYR61gyjgvjKySSnnqFb27pw@mail.gmail.com> <CAGEkeHcq7HeecPyTSYuHWMhCyOAbF7br+UjrFfLiQmgi6kTxhw@mail.gmail.com>
In-Reply-To: <CAGEkeHcq7HeecPyTSYuHWMhCyOAbF7br+UjrFfLiQmgi6kTxhw@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 30 Oct 2026 13:02:45 -0700
X-Gm-Features: AclHuK_Wbx7tTAl_S8XFq74Lo6HCz6RCzxmpAzM8Agr_hE29nmfggcjLF7bCVLA
Message-ID: <CAEf4BzZOWM-v0f_25vNU2LKHRjco+nCYXYnQ0MxiQW8HOtQZ8Q@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next] bpftool: avoid sign extension in unsigned
 enum JSON dumps
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: qmo@kernel.org, bpf@vger.kernel.org, andrii@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 1:00=E2=80=AFPM Hungyu Lin <dennylin0707@gmail.com>=
 wrote:
>
> > please drop RFC tag and report with Quentin's ack
>
> Reposted as v2 with the RFC tag removed and Quentin's ack added.
>
> For future bpftool fixes during the merge window, would you prefer
> regular bpf-next patches or RFCs?
>

regular, bpf-next is generally open during merge window

> Thanks,
> Hungyu
