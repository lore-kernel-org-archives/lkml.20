Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365246;
	b=usVjusqQi6LRFjgtqv85oQFE2OraZ59I8uzM2bjcLBH5MnuSxoSHQkf0iHbycuE4b7bg
	 XDZ+2V3Yt6nfvIIk7Nl35nOfHzC72XsxWKFoPdpK4OtcxXpcdRcWFNd839k5VjXuJeHL7
	 Q/5CCtCm2Vj71PhvQGtEmUw/fmrw4/HBij+0uQWEuWugIONfXDgggLlPxBg6WSvTpTpuB
	 7VF7UYzGuUSIyWQL5zPUZJkyeS4vbj94dby4HmoRbfWUZXc86TzsyXC8QLbUfDuycBOUi
	 9T7Qlkc3FU4EGmGLGGSftUrx4WaNeISL0jSkhtVgwTWHLX1N89qtZi1iLoB6INL4NLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0Jnm/5z8Q1yoIKS0OWVHvnc1/e7g1Ta22xUQi/ka3a4=;
	b=SxwpggEzKA8dOqZVWrdi1X3rLVrjvJ4QP3xiJ12KccN7sehgfCgzSYF/x/+ublGSzipL
	 nXNC4tkbBLg843kRFm78tccQ2bTeJGwhLzvYKxnP1FhlJNHIqMzyHiyAEI5G5MRpjbDgh
	 LYdR/YwY7H3ZYEB/ccUVnVs+53SHrIsJqSzrMPjsH76ODBG736HyvGK+huYj+PZojtdrc
	 vpmaReCLVOOgaVHaeL7gks8WtTmKgz2vTfa5ZTp7CDFT84xC+N2J9NwHGZd+ukjd8N/lb
	 RQlZ7qEjrKoTMfU3LpmCLigUKWG7gFZ/VsoklFL5++wrS+NrMCf1otINneGL/l6idEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KuDb0Jsx;
	arc=none smtp.remote-ip=74.125.231.138
Received: from mail-oo2-f10.google.com (mail-oo2-f10.google.com [74.125.231.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B392606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B392606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KuDb0Jsx
Received: by mail-oo2-f10.google.com with SMTP id 46e09a7af769-85ef6c584b0so1270090a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794365245; x=1794970045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Jnm/5z8Q1yoIKS0OWVHvnc1/e7g1Ta22xUQi/ka3a4=;
        b=KuDb0JsxMmJGC3go1aq9CybLyx66LHQw9dISKsCUeixr8jDQIa831/+uQLnm3HDCoA
         d+OK2X0YHLyWM2hwHXkSUtszeOlcS8P+jZOBEk74IIzh5bC23+oR4SphCsbszGHXn+qn
         IR4Y2qp1PMsh2rk3sccCzBN5iIFy8drW0U73p06DOtyd71CVhwIYsrtwgSqSqI6mBlF8
         6MyTBcVLyMbwwzsOoMQhzva5laQx7msM+IlljUDwgeS/y5Pg77o9b7u9Glg4+cQqn/H3
         tv8Sbl2ibvsTlJoKIM/So3aK+5B1wROsGW98JVBvKVSPRPkzZryWxVR84IrydkyPXK1b
         yIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365245; x=1794970045;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Jnm/5z8Q1yoIKS0OWVHvnc1/e7g1Ta22xUQi/ka3a4=;
        b=FGYr5X34f7JzVSQ95Dk/I+WZ3LKNBxOs3wIBugabpJBh1YUn227XgGWkRDIlUZYxIW
         mVdLO9wXrx5heC9laTWYd5hIb1B81erM4rQzb9U1tz8PpPdGBhx1nJSQ9FqAREd/fGr7
         zG6Ou4AqT2xgRcMhgsGLf9xBSFn3oLg6D8iDuET+QvpuQuov63ThwAaDJLAv7SGMgxL8
         GK95NypoMzLo3IMvnvuOJhCVMbVw2tyE3KpanOebklaKBnOk78NodtqSkk5K1/Us+Vx+
         DCyr7VF7iZjiam75pPdtqTedcwqmq+rZZ6MFXTZ2aZWfYy+u/8S98HF+oqizMrLOunVq
         ZGIA==
X-Forwarded-Encrypted: i=1; AL+hErFnDhTQcI+MnbbTc3FWGzgH5whFCwUf9yPVOkvnrRxNl1fw+fJQgrvr3sJ8hVcAPlbA17LVxBvA54lH/Zo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Gpd45Gdrn2NzIq+RZncmOlYACA49fq4ZoRi6a4iuK636oXsZU
	VL1NzCoy+wdV2St7evj2rtu/XdkmPmP9R3N18+sv702ZfXI1zgEy2nDP
X-Gm-Gg: AYBFou0xeffh2sy493VB1Jh4b64Mnr0R9BJPiV9Fgv1CTt3NvA2OMkEOmuKFClCkTM/
	4EcMdSskcTetxnt6ORjCOyd3JNJikLDBpvgBMLBUYBe46Qubma/a8ngPY4Q3foMLpQlp+D3wcRH
	4TM6uTHZ+Ckqc/NqBYh6MNRsUZgeCEEmcdCZX9yxVunsTHUsrQq2eZCtZ3JGxhSLuVrQ+sUJSjz
	qTMcCfkSfA80Oc64V3TMDL+eIAG4SXN32WO0dewvvH0BpSDoVokc/AM+XovgG2WTcwBDU4wnYI2
	ByyOYO//rKP4QGoMywsUgZfxLKksC8KRco7T6C7Ngd+G4UuUKw6GB2w1mhUWGZkMxCnO74V73PV
	5CZ6UDErokaHwU/cRkbJDPnCFt1kmKAgmG1d5WWtuKpds8MxN8WMUmLkHyzss9rX5SywwGnNbHS
	XKsyIeHe+TmQ/dT670usiAFhlTjGvHPjxWYdRdOKF+YHa58cLHOjngJd+AK8IDr7Jee25gshsCe
	40uw6OU94NB5Fn9RTl4JTO9ftBUmBRTTn826baUGy7oRTeqoJHo49yLGiu8fr4b4yAw6dniFZgy
	167jubF1of4yanvefGylSfTDKWiHgV9oAfLeojD3g9y65w==
X-Received: by 2002:a05:6830:914:b0:80c:d30f:97a with SMTP id 46e09a7af769-860f294e49dmr1058089a34.27.1794365245058;
        Tue, 10 Nov 2026 18:47:25 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f7b4sm3385800a34.4.2026.11.10.18.47.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 18:47:23 -0800 (PST)
Message-ID: <9d13c622-4e8e-4a69-be47-31861f6972d5@gmail.com>
Date: Tue, 10 Nov 2026 20:47:21 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drm/mediatek: dsi: force command mode in
 mtk_dsi_poweron()
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261004-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-v1-1-53a4f46ca489@gmail.com>
 <8c8ff7e2-d1a4-45c8-aacf-bca93439a32d@gmail.com>
 <524b9675fd10d0d21880821c10a4f0e188d24956.camel@mediatek.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <524b9675fd10d0d21880821c10a4f0e188d24956.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/10/26 8:43 PM, CK Hu (胡俊光) wrote:
> Hi, I'm Chun-Kuang [1].
> It's not necessary to resend.
> I would apply this patch later.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=93e97f715b24114169d18654e09c646fd9e14979
>
> Chun-Kuang.

Hi Chun-Kuang,

I'm so sorry, my brain must be taking a day off :p thank you for the 
response!

Best Regards,
Ryan Brue
