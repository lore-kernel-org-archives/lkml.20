Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.244
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204201;
	b=eMObMN1b4jygrOno0jlMGd23uQ8/0ubTD2vDgynmZZlp7sY71BcMJOO2C9jLmKp/L2FB
	 O1N5GAtE2YlbommAolB2osSPK3fOSf+3/UKfFKlCINI0kaVMmhSNgrlZ9QXpZIPdbKnh3
	 0AHVksY/j8vHPqACJzzzdOr76hEaFercp26Oex7I/2eeWC1Zacf1MUfenK3PhgzU6//Xe
	 JznZHnz1RqODSNPGJYgE45EKGLgumeMfrJoZwRbLtAWa8YIAyiAECTHvQim9HmeQRmoTy
	 qVSXOI2LthP6pqHlPhs7lphNXijXrYX79iByer4yBvAiOHez2wXtr0Qta8W9i8L6FgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204201;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=8aFFg/f5lCp8cfzM/17tMs4jbzwWt2L8BSPSCS/65p4=;
	b=H5i2HuSxXp4rPYDtZFiF5ddcRKb1ya1KZpfUsLwv55G1tx8UDwoI8dacCIXTsmj26SxH
	 bOh9Z7lIrdhcMPQx8wT391dwPyy1jxU6xPQDYKYLCAjNHnUwYS+RuMemkkF+8erGZWCDM
	 ic3PqlIJNdmik/lhsAVlgcaQnMRvm6bCYD1X8S82f8ICYrtLWaKer8CpHndgLzYC27wPC
	 IvQsmsbFstgTYDrnz7MHKnyppKEvFj5JrPescviBJcWbjtP+aAfM9voMt5bQ2vWFXrpD2
	 sracuiYLJH2BsbJoosYWcg7h/9cPO7/SLnxmeQNxuJ6k5Z0M8WtB8YMR1APCxS2nDoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xJolS1Ut;
	arc=none smtp.remote-ip=95.215.58.244
Received: from mta1.migadu.com (out-244.mta1.migadu.com [95.215.58.244])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4995606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4995606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xJolS1Ut
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tee8SHa+iz3gj+gchv8xsoOLTYKhUDztDrsq7diRDDk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794204198; v=1; x=1794808998;
 b=xJolS1UtIPtnrE/bhtwLvray0DB7wP3Ws0PaD33OVwjWy3LkCCk8NBszKPbq+Fin75lKHVXJ
 NXZYLMF75F//n9LvDM118cuK65N32fX5EQwDHvHkFBVZpSN5gIzva2VejrIsZ+HwprwYM/TPbew
 yM4d5xOFTZUjLMbiftFY6qzk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3487b6774cf131fe;
	Mon, 09 Nov 2026 06:03:18 +0000
X-Mizu-Trace-ID: 3487b6774cf131fe
X-Migadu-Flow: FLOW_OUT
Date: Mon, 09 Nov 2026 07:03:05 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ping-Ke Shih <pkshih@realtek.com>, Kalpesh Solanki <skalpesh942@gmail.com>
CC: "kvalo@kernel.org" <kvalo@kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: =?US-ASCII?Q?RE=3A_=5BPATCH_v3_0/2=5D_wifi=3A_rtw88=3A_firmwa?=
 =?US-ASCII?Q?re_recovery_fixes_and_LPS_hang_handling?=
In-Reply-To: <9fd1c42c5df94629a21c41dd08645b96@realtek.com>
References: <20261108085126.331784-1-skalpesh942@gmail.com> <9fd1c42c5df94629a21c41dd08645b96@realtek.com>
Message-ID: <27E9A60D-26F6-41D6-B74F-7DEF998C8498@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On November 9, 2026 3:30:58 AM GMT+01:00, Ping-Ke Shih <pkshih@realtek.com>
wrote:
>Kalpesh Solanki <skalpesh942@gmail.com> wrote:
>> Changes in v3:
>> - Note: v2 patch 1/2 (DMI quirk) is already applied in rtw-next.
>> - Add patch 1/2 to clear RTW_FLAG_RESTARTING in rtw_ops_stop()
>>   with Fixes tag.
>> - In patch 2/2:
>>   - Count consecutive failures before triggering recovery
>>     (RTW_PS_HANG_MAX_CNT = 3).
>>   - Reset ps_hang_cnt on successful LPS leave and in rtw_core_start().
>>   - Suppress raw register dump on transient failures to avoid log spam.
>
>The patchset doesn't present in [1] nor [2]. Please wait a while to send
>newer version after it recovered. 
>
>[1] https://patchwork.kernel.org/project/linux-wireless/list/
>[2] https://lore.kernel.org/linux-wireless/
>
>

Hi Ping-Ke,

The linux-wireless list is bugged and nothing is appearing on it since
2026-11-06 15:46 UTC. Aren't patches accessible due to
linux-kernel@vger.kernel.org being CC'ed?

Best regards,
Luka Gejak
