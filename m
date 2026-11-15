Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776597;
	b=f3yQmOG+AkutpSzMDFWZyN0QnHq+XbMb8EHK30KBvWY35w+zu03iGbZ8DIuPfDNzjLXc
	 eh9tiDKxSL/VT5HZ7yykx/0OgEkKSMHvNcTj+07+MXO+J5JoFt3GcpLNppsQk+aafreQi
	 4FYr25NMNjElr0ZqFyJtRYmUv1LinFpLxvRI3vF4TeB3VHWr7xZXHzL5cnmOeae+kumK/
	 V+k8EBYXBpOynOjGDpem7PkgV8vgkkZepelDh4qN+sxiW2S210GXiQ3m9epUKJJ3TL6uD
	 tYO0F8nziPmAUWYMKO8/hk2W3WM1pfHHV/JDjBaEbKglpTdwGqewliw2u0AO4bqqHQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776597;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=vHFgHSvHI5eSzCfUPZ2yIuU6Boys3jbWPHp1Mry95KY=;
	b=SWDlVl9sGN5KweZM7DSIvBgeovojz5VG1deX+OGs6CaMswYHvQNm+wsVydPxolrdu7fM
	 vQVI5VZxD7mURLBNAx6Ib7HuNAd5aq6tdz9IylXGylTAlnIgVXwqrodTOq0pvfr1un87A
	 ykiGqh0fG0SbDoUzqWqjIALkGgSIRPiMH9lOOAK/viDvWMZ/HDR9g/eJutR/BRmz7UM5Y
	 /d3pCvpqfNdOtbRpGWRbNT94z/Q/L5H1R5do0KdrZuaXzr8vLJmaBDZkpIdxaUkK9yHuO
	 8QlqaG5Le9FKVR7U5Vfu5jpD8n2RyEnEsXDULzoEtBOjw7luH5GGyKCvfldMHbrOoiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Mi5pJsb+;
	arc=none smtp.remote-ip=209.85.128.228
Received: from mail-yw1-f228.google.com (mail-yw1-f228.google.com [209.85.128.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6180F606A338
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6180F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Mi5pJsb+
Received: by mail-yw1-f228.google.com with SMTP id 00721157ae682-8b4d26094beso3114967b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:03:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776594; x=1795381394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHFgHSvHI5eSzCfUPZ2yIuU6Boys3jbWPHp1Mry95KY=;
        b=PevxLP+WsRw4IK/Ppi9qRRuHbSM7kTi2o5GuBSBtzgwcivY2JqBhSKBJGch+1tKZvQ
         dsd3FwGSTZVGRwDYc7GbI7uoaBSZFsgjcW8VH0IMDqThOTcpZBPijCg8DJupUNjE+8LS
         e0+ZM6PH83ww80TLbZOTmixtz8Sn7qdCMjG2Zy5a4x1cNYi0uc+oR7N+ZnjevRVQD45l
         3cwv3n7DZb9+Is0/Zx3ZwAV+zmBKgatwjePBOpBQO5ewvlGToCiASgCqw9IReUu54jql
         YntrpEy6Dh29c54EIJnOZjtjP0LIiUAW4cTNPnHpoRFpwATcd+PBz4AtHRlwScssNO6M
         397Q==
X-Forwarded-Encrypted: i=1; AL+hErF22QZR5z+UHyBd1flOUnHPbmEO8iKTtGoakJcijZsAuIiVF8kYw3MSOD2HUwiElZBSzbtFPcH68dBRuRs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PyU1g7InUOVLxNsWvrlKLnatNq8CGqVfFmwzFdM9hh/EOQqTJ
	DrKaV+uuukmeD40EesvKhp3K8LYP6bjeiJA3lAgeu1WbatxiETrbZqhHGbAvmzg+H5MG5MhzRoW
	48why6a8vbUNOck4CgxeB3zr8hw7CS51IeZMRCiSKbkvf6lxNAuuMtdKneIbhVnvWiImKBa3iLr
	3rWP0BQk+IZy2AU7JzrwqQfIfQPgBDxGqotILgf+QXhC2xlWEiymxir1EsfTisRmLYVC3JLzEHS
	KkVWtyfraNfLNZpzrHzd+sEmA==
X-Gm-Gg: AYBFou0wDDPgm7Kfdp9XwHz8mq90F7E0jjpSKtGZLDGQB2dOlt1Ma+wEMjwUGxtMWk6
	qMe0aC0aJSuwwMRxGppBz8y7nQVfluMqeR1SQCZ/ZeFoUJR4iIzZND1bwF65W6kGvC40d8HN+1e
	lWaz/XFp/oMheTeQztl+DFpVaNYlj4KTEt7yv0H+n8tNuBr0vOKi8F+xTvsrQCuTJhq1Br1lvyt
	xFFOdBLimiod3f+kpU6NM/+y9YWenukz9yHPa93EY0KdJNug0q9QKyUQQdZVUtg9UYMPrIunDJs
	MBKbVuT+R2fqF087Jxr9lAu/WrJkBAM9XwWPVJ9r1KU6lih7GCgRHR0EwxVFdForUrwdCY4s9EG
	vJYq2SIk6sP/Pphm5iuxSp2Nfo1BwNGFOgmXWI/RjHKGcDEEj/72AHH12beImCWATaKdBNXDTu9
	F9plZKNGyEnTSLqGrF91FckGaUI2AQkqe9Ja3vAtkw8Q==
X-Received: by 2002:a05:690c:6607:b0:8b3:22e5:f52e with SMTP id 00721157ae682-8b4aa2f60aamr56372597b3.53.1794776594071;
        Sun, 15 Nov 2026 13:03:14 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-8b4c996aad5sm228597b3.26.2026.11.15.13.03.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:03:14 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-37628596fc9so7597498eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794776592; x=1795381392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHFgHSvHI5eSzCfUPZ2yIuU6Boys3jbWPHp1Mry95KY=;
        b=Mi5pJsb+cf+7BFKJ4qwe0XBLtzNr5KV4R08ZsOomId3sXz+3cBTkxmDRJR2ndr0ORF
         chmI1vwcbNZSJibperqtecHfie2UxyT7EYtaClfpGiLGPCuWcCyvOdROoE4pkooKNamu
         rdZkjuR8lA7JvcMzq66WN2wNYVhFGgnl/vEts=
X-Forwarded-Encrypted: i=1; AL+hErGegCie0N6w9Hs+3NcPRrUXmV6t/PVxZvuQhHqpmljr64GhY3lxa2HfQC0/59YSjDaK9+ndh0S0TnDUlLU=@vger.kernel.org
X-Received: by 2002:a05:7300:d946:b0:36e:2626:4ace with SMTP id 5a478bee46e88-3796365edc4mr9383046eec.5.1794776591900;
        Sun, 15 Nov 2026 13:03:11 -0800 (PST)
X-Received: by 2002:a05:7300:d946:b0:36e:2626:4ace with SMTP id 5a478bee46e88-3796365edc4mr9383015eec.5.1794776591057;
        Sun, 15 Nov 2026 13:03:11 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d3e37sm31068797eec.24.2026.11.15.13.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:03:10 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Aditya Garg <aditya.garg@linux.dev>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Andre Eikmeyer <dev@deq.rocks>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH] wifi: brcmfmac: pcie: Make antenna SKU check optional for Apple boards with BCM4364/3
Date: Sun, 15 Nov 2026 22:02:53 +0100
Message-ID: <20261115210253.883721-5-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111141756.11564-1-aditya.garg@linux.dev>
References: <20261111141756.11564-1-aditya.garg@linux.dev>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 11 Nov 2026 19:47:56 +0530, Aditya Garg wrote:
> On iMacPro1,1, iMac19,1 and iMac19,2, the Antenna SKU property required
> for firmware selection is not advertised by ACPI. It has been found that
> the firmware shipped by macOS for the BCM4364/3 chip is independent of
> the Antenna SKU property by comparing SHA256 sums. Thus, for this chip,
> make its requirement optional and use it only if ACPI advertises it.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Aditya Garg <aditya.garg@linux.dev>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/pcie.c    | 61 ++++++++++++++--------
>  1 file changed, 38 insertions(+), 23 deletions(-)
