Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810957;
	b=VlqMPQiCDPqZboXgFP+8iTU/jBYSvdeq/+uwVXkeusvBFxIY2ytz0JgFv1nMVNeHR5js
	 sfBU7I+Af5s7RmKOvVk9JFi3DHta9GvfxzSBrzGTmZl3pPimrmNVX8dEk6J95o08ofE8F
	 zyCH6ghSU9CDX7R+TdYu9r/eEzqreOh0cT6xdlVDQnlDQOOo3KIyftJwiBH1mp+mKp6g8
	 zTzAp4C1D9cwUJSSyz4l0IKGbAZJb/6yel5Obnl3jMQBclxaY5J4RzaSrJM2UYXkXrkoE
	 t7tbPrO428+/UKafBbZ3ruIyzegn55AjlgQgsVmYnHhcBJVk5CU9jwZewyQJ1uLUxGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5aDf44Gat6Pf0H0w4M0JG4CAOddgF7K2Xbo5NNmzKjI=;
	b=iFiQ4gV/Oty3is8Qe6gTA7hp4uL2e41q2LuiZJxWEiKLYP/eUeMOijowja8a1a8fSyLE
	 tODg8kdP8ZD4uj+4tZxE5if5XHkphJKdNfUXJcnMUvzYrVsxnWWRAiNTCzjWbEnGVUbpF
	 ekouTMXiHZidoKRS05oSCXWdfJ7durLLCnG5iQvT2TzNz3ekLjfhWNcHrMNu5aAbEpKbu
	 J/vU3bWIYHdPmdmfhQD4S2NbTRzp+22U5rw5rpH1E0lJXR45Nwpys/EX1WHjM+evhLWxJ
	 shccdj3IFczITgQI8NBVq7giLf2ZUU1+H8/0/CIZdIluqBqnh1d603zOTEPGYKmp4uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WwEhG62+;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB09A60A5BC8
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB09A60A5BC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WwEhG62+
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6de2f213b7aso649097eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810956; x=1793415756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5aDf44Gat6Pf0H0w4M0JG4CAOddgF7K2Xbo5NNmzKjI=;
        b=WwEhG62+BnK/G1CmjOKJEAdiw0cztslgqRQMTvvG/OKwJkQYpKybttT8gmQGrxro5C
         MVgBYyYct1m3wZV+uT7b+nKBxwXCgj+/poDJGnsXG3Rio6UJrcGe1OuVzd1X81r7B6S/
         KD3/3aoRVYZu3qeV/xlXjGpuPsgA5eqV1CquwrNh1QHHap1SxfFZnu2xdNAtYcS5tbOJ
         4qzkbGyOKux4goYUnVZgY0mdtP9y+t4dcYja/Y1041UH9GW+N24OHChberYJSsCI1AcK
         xTIM9lTjAKXXPfYvsAE7VvQEK/nC0MxAtxQkro3uA47K1g67NpItcRr2mQp9iughsmey
         Blfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810956; x=1793415756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5aDf44Gat6Pf0H0w4M0JG4CAOddgF7K2Xbo5NNmzKjI=;
        b=joqoD18mHW7N2I5SI7jmp2sPYHpJeJR3m6y7Rgdur/fNoydkOJtM/gkIEZREpcN4aM
         tu9WtZ8G9MrGlEFrS14YDh1Inc0SPJ/fcsf7jdkAYDS7rnlkykRN5AHvRDVCUasKySkX
         LQGN6HyGYXogP1Ws7F95ecMxwcWC3sdThbzMTm209m6ycRkLfIYrUv8um65T1RaWU1ZI
         +wNhJE3eNOa1Rv2NMfryNN8tkC8m7Uq7DUTUX/FBTLUs1Whjd9xtcnb3qnHLsWZ3gMYY
         rnPP/pBEMN1B8cHMQLIBkOAnPgvzUk6yu3z2Oy7F0kb5fBjwx4ViLAvGfS1Bc1lvP5CX
         Gwxw==
X-Forwarded-Encrypted: i=1; AKwUvBwao6ao670zTn8+i7lTuDCIOsliCxKTdoXcL6VIdw/YIwo4obYNONGZ8qTix4JXOKJi1ED3BvkWl+JCteg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+KWf4KJGEWWqX5TVvSVaImo0wcNEH7D6ClXmKnI2S9dg76/cp
	Qxs5oLtqsxSN+uNIsTJp0iPQKv5IAqmahGgJYUICZpwfbOwSVtePjhCS
X-Gm-Gg: AYBFou0/T7VBf9goON8xjNKyTCOrdfStjuY4bFdImah4rGPukjUlre+fNeJStttgTj4
	0sGW8ZcqCZ7Krasg0A1QTgvQ287pV1z7b2yt3pdrxoQpK30XS2Qd4XH74Be1lq1oHFMu3+1c7U1
	ABiR3BWqp2ZKzGRVCdlmdG+EJJJnlLwDqd11CGEl93trUJ4GZ+zpzK5pTHL7ZINw9GWvkWDpL+3
	HlIuQsVxepjj9U1ejnBmaoXh8mFPYeCXIolt/uAKyMD1PUFNhqp3V1iGydR4hv8fhLcZ698oTB6
	eoHHqJfPaMYUxZqslkHt17XaLXVYo+clkF0rTxWMPYcTFJXACa96YLdYhaWTIC8o/3+cSXVfuNY
	QQ4llBY4z+VZLS9xRl1NPtKdqrWFB+Z1fNMgNbnFxC6dM8/Lip1SZPynm8y+J0l/0nTtIlxIpvH
	cNsyU9ElxcinWOd85T6HyDgM9B5jsmqU6sFM9M9hfzg51tNNvUQ8PEIlEVLneYNj+vbT+lDvFJF
	6hbulDpZqtZme6rRWHKAvTs2Ae35L/mNPt8R24ZEHVB8ImTnpaYYNqQnoo8cMCPiJsp7pTtpsY0
	4aOC
X-Received: by 2002:a4a:e915:0:b0:70b:8307:9bd9 with SMTP id 006d021491bc7-70ba0f6f55dmr422950eaf.78.1792810955676;
        Fri, 23 Oct 2026 20:02:35 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:35 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v5 11/11] phy: qualcomm: qmp-combo: Fix error propagation in qmp_combo_dp_power_on()
Date: Fri, 23 Oct 2026 22:01:36 -0500
Message-ID: <20261024030142.13643-13-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001-glymur-phy-v3-v5-11-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-11-3848c2615d5a@oss.qualcomm.com>
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

On Thu, 01 Oct 2026 15:04:28 +0530, Nabige Aala wrote:
> The configure_dp_phy() callback can return an error (e.g. -ETIMEDOUT on
> PLL lock failure), but qmp_combo_dp_power_on() was ignoring the return
> value and always returning 0.
> [...]

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
