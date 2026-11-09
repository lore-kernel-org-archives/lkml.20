Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243864;
	b=q3qGwqUOC4Khouua9PZ48ayCV7OJkR5BAjwoVrKGkx/uSG4gSAPEUMGcYzqc4G7uH03l
	 JG/B4/TF453zrcybOYDAZCOf/WyQIwLjCUqOMg26EBR9ZZWIxwxhsN1qqoQq+L/+FnDub
	 6XZsGoad7GawzOAWZ3LjG1oy+L1iqBnG9JN0Ms2iYgSZZc4obWGZ4lABNiFUg22OWAciT
	 LqbwcO5rV+E1idrfqDnBPPGENckGlx2hsECqOgOvHAaeFBVSYEOE88qwHmxbqUg/SaMhV
	 4RnS4tXLyeHQoMGpcF/XjuXYL3u70avgUxX+JghpJ0sNb9kP5fjDWtO/eoXL1+9aRLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VmhgsZdfI41q6bSk6Ws0aoyQukpnInOpVRPvZF0DgoY=;
	b=vfOAut/+hEdwUCMJzmhxJzhrkm7rdkToZm46CEEjxQjB3hKBIa7mx5cDK0kmBGflLJy8
	 Pu8D5v5df6ZrRNjxypAIrNHqNGAhJv2oB+4YzagDhrmk3EwJOxpAc7hNGoZoyx3Xibj7d
	 4tZYOeKmH3Y+JaU2S6JIgL2gK5O0YS6kMl8M1GpDKxRIfUzh2NjnixtYAk+ITtqqjf01r
	 HQxya5ej4d45LCdG7nfgzxSQ9gySXqZCcH3m4YwZcKtoHl/SgIyROwt0SL3wzkOxYcGz0
	 EvWv1XrB3plUn9wBGzEIYdOAYDcEkEz2FtCszHtOztPDXBnfgd8D5LkoLTQLz8hQYcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INMhwymN;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F20606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40F20606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INMhwymN
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so1359048a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243863; x=1794848663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VmhgsZdfI41q6bSk6Ws0aoyQukpnInOpVRPvZF0DgoY=;
        b=INMhwymNUoXRa1HYjajYs2VDNOXoDzVIp/an3nVGMwTgqTKKIXcrYlToz3KguYeb2w
         0JSHPrAS4tp1u64diFxx98ot8r0Zd994Q5w09w9Wo7hRC/DtQLXBMMh5MnMbGm5sg/9+
         bfSbd1NNz976A12xlmIC5rBcyt2zgrNxYngASmeZZcCyhLh9b9uOIuPyOYnguxqTaeNR
         9hUslwRJlODcmrjO84K/MqZr6AW6G7obz3aQhSgpfQbvfDlBiGQqmaSqVNfiSLuoobIb
         SEhjw+R7G4bUMif5HGg+3AGlsX3R7zQQDPntqdP45khUAZLh8+Utt3l4+Gfo8W0GMqsn
         XheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243863; x=1794848663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VmhgsZdfI41q6bSk6Ws0aoyQukpnInOpVRPvZF0DgoY=;
        b=y/m+1f5AI1sOUkIEXIPfGWerbDz7m883cW4+gkY7Fkus5Rzl3eASPKUd64ZojlyK2O
         o+goK1+X6gWkgAtDk+0SJu1o55YB0XVSPP/5jO/BUcoHJH1xzYtBPbE8pLn6m5YwzmO1
         WCzUopcN6QZ+/eLiWAPVh2AUVYxwLtz5+2xTlGjlxmc6ZiVSikQiFrIw5ftuU1eRYV0u
         cbX4YJ0H5tfAauZTDS1JJtsPF0F4NfJ/1+/PfeGeqM/J0840/Zv12sPBAWl7dcJM1n3H
         5gMGA6PZCb0T/9+530VrYrNc6rpDak0LhhXPCr8ebleyK+ZbJUNPsBWo6c8ir57fVmOK
         75lA==
X-Forwarded-Encrypted: i=1; AL+hErHxKAfdm8l9WY9N4aVdt5mA/OaTHk3E6CUfQtQGdWUNfzSaTrZVxQF1ULh4+t1XHdVYamwtDldM4qDT7pY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nf2bkqEnbTmFhYGKbqtZ8lt7RZV3+QRzBGPR6Pf0U+ArFdW0+
	avAlrY6/AvKuPa632KvR0rfZ0oQbyTyDErVbLfWVis2TS42sDgWI63h2
X-Gm-Gg: AYBFou2xdsgL9/fkAL3h9RkIIV6C0XFHO7CNZUZ8JP+m91DbbXNKQFj5V5SKCrLGT75
	Ym6QcHH2dL/AWv9pWoTcL8cAwcur4naxOwtdT2uI9erMLAwi1TDFM1ZdD4CZsKlq009cxPpvB3h
	WwYPChrsq6maKctshIWTxPT+49qA/nGnhDbvGc3nwjPW5vz2tCUpx2+1le8OKp2jWwp08XioJIi
	7UJmp0bS8BxNNMHRS4AgiaGxafYhUV6/6YRThMhIs+tvM/LrO05o3xbyW7sfQcxUEAtrc32BDrs
	sRBWXParn0ynA/ip4ozURarfD33o6NkxLji5C6eVjRX7j2iaCCczpEEwgvIFIq+6vdUVFQNZduB
	lQhPE+wI9uqizfEW1DbkZO4J18P6691Wxth090kqrroZPDORnqb2C6g/4qSdsEBRnjDqAghFt9g
	BizCzOz54d+uDT6HHI12i8qQRMJZtXIRDbOVXHoq6uQLQU63Tv27NdLJ7WnQt8tF8bqUyy5/KXV
	R/io694N5EZ+XOkEQIQKuYN+rkjobvQThNjUkpb/2qfwMaDd4ObMMXZkTUM5ts0XoIFblaWJ9ef
	8k/K9RVX7MDwIyTw4jtGqKqUu3A=
X-Received: by 2002:a05:6402:2356:b0:6b5:7792:d82c with SMTP id 4fb4d7f45d1cf-6b756ad7482mr185305a12.16.1794243862514;
        Mon, 09 Nov 2026 09:04:22 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ebe31csm1878937a12.16.2026.11.09.09.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:04:21 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Lee Jones <lee@kernel.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bean Huo <beanhuo@micron.com>,
	Stanley Jhu <stanleyjhu@google.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Georgi Djakov <djakov@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 17/17] arm64: dts: qcom: Add Samsung Galaxy XR
Date: Mon,  9 Nov 2026 17:04:07 +0000
Message-ID: <20261109170407.2073295-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <3ddaacfd-59c0-4d87-9b8c-2caa85143393@oss.qualcomm.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com> <20261109-halliday-dts-v1-17-289114ab8197@gmail.com> <3ddaacfd-59c0-4d87-9b8c-2caa85143393@oss.qualcomm.com>
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

On 09/11/2026 16:12, Konrad Dybcio wrote:
> On 11/9/26 1:33 AM, Stanislav Aleksandrov wrote:
>> +&usb_1 {
>> +	dr_mode = "peripheral";
>> +	maximum-speed = "high-speed";
>> +	qcom,select-utmi-as-pipe-clk;
>
> Is there no superspeed / dp altmode in hardware?

The headset supports USB SuperSpeed and DisplayPort via its USB Type-C
port, I just haven't brought them up yet. It seems we need a new driver
for the Type-C controller.

Stanislav
