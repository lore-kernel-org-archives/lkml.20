Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657092;
	b=Cq1XucTVPNh/nkvMLsND4RESTvWTNHbtK00YNYaoEUo/OF1/m3s7BamG0W/tp9F3Hoxj
	 wnZb45Pe+hnBjiSZikS7flvGFYLWio30KcSEDfx6cKq5VXmiqfi0wqXKTUNdFzt/z3HDR
	 yPleNltv01RiMO6XR0ijJaQqc8XXCC+JzV0W/6UtY5EavOHejOon03sb5LUJrxob3MGfg
	 VpFgZP2+9NRD7aa6U1YG6M89n9BARXL0XY9bNjjlOa0WvRchn9LJfzm8CI15xX3VpwfJD
	 J4NmeVHj3Gl+Z5UK048LRNl2GsEystohubfDmUm46+jwHOudXrBbgOGo/2+U1ieAPeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=3teTHgI6eBV8JhAHU1p2Vd46MVJYm6aXsAh7Xpa5ptw=;
	b=oSf0HaSCQVG2EV9EvAsL5uorgNIJjKmZwJwZ0x5JbeGDkSdkzsE9M9ZQ2WcbZeJ6f2DT
	 IbgapmVnSmtojVnmGQ3Qmu5CotxrXC8AFi87IPbYn0UfiM/7fCTNT/gJ0PH5hgCCdwClW
	 dNaM16NLwQmGlRhYR/ogojgW8gmnLGphEdL7WHJXN9jhF5UaY8eY4/U7MYWgKwbqC8PKG
	 8RSlXacHkrKNJDQRXgmrwDYn0XDuDemWUW2cMhhtj1Xef4O7C0bOBtX7QH65lgvtsSVbu
	 /5xa07FASVMeM5D9yzSKSxiG0VNYiwKxFzMEy/RNIRu9zhW4IiAhdEwDZJWdA1AZDTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sP8blN2W;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF945606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF945606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sP8blN2W
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3514b90bb89so7247246eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793657091; x=1794261891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3teTHgI6eBV8JhAHU1p2Vd46MVJYm6aXsAh7Xpa5ptw=;
        b=sP8blN2WkVtaBfINDqMiWwyea3rOBB913AD8NTnG2msbq27jreXWiIWejMC1k+vvuy
         bMfZ9GEcVFMC10L818A4xPZEAuMoshJKwubobg2hxc185L9svfh9VuE/vQw1il6F9scY
         YGRZzJV2xBNwaYDtyDMauk/I5LoXRH/5ovlziwkKSTxwz83wNCqPS42d32tTKUuw3soA
         lHXo6BJCPYlf0qJbUIRXO/kcDk//cZKtzyi8IHgCh4w53mL5s/OYM7oGKBz+5KzwuJgO
         3VjrH/HwgN6lzZym99sJ9Ov/DQlG8XgMZ0GfI1Gt7KSBT08igoepho2lLGtKR2UugpEu
         v2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657091; x=1794261891;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3teTHgI6eBV8JhAHU1p2Vd46MVJYm6aXsAh7Xpa5ptw=;
        b=S+nECwHA9HjNn7yTH2PG3ShSIx/VjRqqu8n+iE0ADWr8F2eI7b2lkMqaAeZw9Ld3Do
         EcnqlV08SPEZ/Omsq7G2gMxEPLQXOq2W4ENE6e7GGBX89CMP4SpRvcB3RudChDAv8pzI
         TAdVliS22L9X5NbnfLJbpdoa94xuR6HkOR2DVqKIVrX9q89qGBg9Y41jFnwdICbQLD5f
         3Ga1IdYSg5LaRFClwVp3Fny6QBszLQHLSQy9b7e92PPxqN15S8jm4nw45e1pUla7fyhM
         ca6mR/ulZO8Q6CbHZxqZJWWGa0+zGT30VF+b72+RbkrN7X05RuVZe0Rd1BCHJqt19U2y
         edDQ==
X-Forwarded-Encrypted: i=1; AKwUvBybeii27AQDlEx9iR0M+KNg9NftspWymG4PwbiwsCmxMNjbZ1yKWeRSod8fqW25LLhLR63540oa89mDrxM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y1xvRyGT0Eiv1pdfoCnnTwW4mKXRN3BVCDWsCmAUfykm8maS7
	C3qh19rWuAkx6wiQt36xHA/jvee8Py1N5JEKs/e8q2EEBCsfzgvzFN/p
X-Gm-Gg: AYBFou2O6qqLHOj6v6J70wV6Tjkh6YVr3tlGCOH8JOaMNbdKen8IlvLxVLfWb7k1h7W
	Pkvpag/KJJvhdEasfubb/2/keRTU72lpRaLrktCZLN8fbLQOST0ixZW8+nZUsXGMH6uUlExcNMq
	CnU5lF+EoMr7Sf2JfhUFC8uJkj+VidQ3Ek1TQq/o9uUmaYDWCo5/nwn8794nu8QHgPKSVVSF4b9
	UGdPPZuaaxAYWianX0EK+ofvEUybKtOgD1ndUS7PjVNH0xbHu7/oK9/BOIWZayjp0FHaLRDMJzI
	1n9vwgPi0Xtwm/R7goununpJch0uX4lWPedovgZJrAjKdp1LXiL7wMl46OG6cB61aMxzXhQuJW6
	pyRY/NdjqJxBTpCxn+CesjMoHKXrpsKig1BV/geu2+Juatt89CvKeYnIndv3dXLG/SuxZ96yDob
	fnd/Sc1WaRYhuovdnTLiJZ2FBZwveMRh4MFQvnnsznP9tU6LaQms+KWbFCiEbf98Y0r9h9eKTcZ
	+vy436PuQcHnxS7rG9mTJuXEY4ayPTFRebLCKnfg1sAvQgsuwIyuxBmGssMuPBZUhBa1DiTx6qu
	FaaYvs55LOTAwQC/Gr+fOJH4Wq/WGsw82SyfFP7eF9tR
X-Received: by 2002:a05:693c:20c9:20b0:351:245b:d1e7 with SMTP id 5a478bee46e88-36a42061e10mr15018801eec.0.1793657090744;
        Mon, 02 Nov 2026 14:04:50 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm38466358eec.19.2026.11.02.14.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:04:50 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	mani@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	val@packett.cool,
	wesley.cheng@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: qcom: qmp-combo: Leave the USB PCS alone in DP-only mode
Date: Tue,  3 Nov 2026 07:04:50 +0900
Message-ID: <20261102220450.1670-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <4d831e77-2123-46eb-90ed-dca3c580d47e@oss.qualcomm.com>
References: <20261023123512.1912-1-26rote@gmail.com> <4d831e77-2123-46eb-90ed-dca3c580d47e@oss.qualcomm.com>
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

On 11/2/26 10:32 PM, Konrad Dybcio wrote:
> On 10/23/26 2:35 PM, Joonhoe Kim wrote:
[...]
>> -	ret = qmp_combo_usb_power_on(phy);
>> -	if (ret) {
>> -		qmp_combo_com_exit(qmp, false);
>> -		return ret;
>> +	if (qmp->qmpphy_mode != QMPPHY_MODE_DP_ONLY) {
>> +		ret = qmp_combo_usb_power_on(phy);
[...]
> The USB sub-block provides the PIPE clock to the DWC3 controller.
> If we somehow enter DP altmode before DWC3 gets to probe, or if for
> any reason we need to access that controller (maybe debugfs reads),
> I think this will fail.

Right, there is no PIPE clock then. But there is none without this
patch either.

In DP-only mode, qmp_combo_usb_power_on() writes the USB tables over
the lanes DP is using. Here it timed out waiting for PHYSTATUS when
resuming in that mode, so phy_init() fails.

DP-only mode is usually entered after DWC3 has probed. The mux then
powers the USB PCS down under the running controller. So accessing the
controller in that state already has no PIPE clock today.

With this patch, the probe-after-DP case ends up in the same state
instead of failing in phy_init().

The missing PIPE clock does break things on Kaanapali: starting the
host in DP-only mode fails ("Host halt failed, -110"). I've sent a
dwc3-qcom series for this [1]. It switches the controller to the UTMI
clock in DP-only modes, like "qcom,select-utmi-as-pipe-clk" does
statically. It also makes the controller a mode switch, so
pmic_glink_altmode cannot set the mux before dwc3-qcom has probed.

[1] https://lore.kernel.org/all/20261102215121.738-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
