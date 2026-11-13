Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.91
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560883;
	b=JeZA4o/oVjmb8NWzDx6D5IeVFODuJuoFpd1L5guBGLu1urrL1duCaWL+nIS9pxFuuDd3
	 BmVxjU5SFEQ15gcQMbySoy7P5hAjfqi9EpXtjPgtgOCEJXbUJPGLIJVIyc4JnabHJ0Efo
	 F0+cU3ocxzrLMxujiagVGRtZoax/ZXKtfPsZ9KdK0GLmmK9GDat9GtdXJWGnE2m6UQokD
	 qinPKdMawYjaBAwhydBf9rueR2AQCThJT7kZ1dzLKV2xHabxFOW9UjMfUnpaECQm3feJ/
	 YiXF4N5dlDufAF7lGiWbxX6lTfnIfaPJoXexzpnqnl3JaIBO8M9jJlc9v1ks9dH09zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560883;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3LM4e3r03BUBo1MxtYrG6dqzSL5ZJ5e0GwlJ0aroQ3c=;
	b=IOm2Xc/1lDLF76b8WDijyGHXgi9i1QSlM4NT1+flflA1Mfwj+xotI3wFmwtRTBJRrw79
	 ClHjrmxYEoSwuHS2Z0WjP/5AjqcgKpHpbhKDE0Y32orkLzlUaQFtCzFgsSUdqpvfC/3zE
	 chNWnMSNPM7zf5aNp5ptznoXEhiQxVQmiyryPzw92Q3zbpb4c8bVh5+rYm6QQDC+GdAyt
	 CCahiIeDbTED3Ls2T98nYk7KGc69+Q4VpAxH7qVUWkDUbleWI44ZqAjkjG0jP//29wLH5
	 PeTH3l+Y/tqg2olgZyQrDohWmWxI8E0QdOcAgYteLOEiMcJdAgppDE08VpvJbVVNi8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oaywe7bI;
	arc=none smtp.remote-ip=95.215.58.91
Received: from mta1.migadu.com (out-91.mta1.migadu.com [95.215.58.91])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CD2606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27CD2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oaywe7bI
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IMg4DqZmrvZgGsmh8/Ch06ENTF4HGscvQfIkl0lWz/Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794560880; v=1; x=1795165680;
 b=oaywe7bIYvO/hLk76vqM9O5Iur17HNwzLp6H7YLkRcYzuB0Mn59hFOzcdVGB76LUpyKBBoRC
 NGHS5XcuprI2BufbxqJXu4dGFQLZwhaNGnWIEhVzht7IW1dXyqRFMj4ePf6IHJqsYobZcf97juM
 byzR43PCw9Rq9fd+6eoRR9+U=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 98ee992137e27110;
	Fri, 13 Nov 2026 09:07:59 +0000
X-Mizu-Trace-ID: 98ee992137e27110
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 10:07:58 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Jie Feng <hjf3108@gmail.com>
CC: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v3_2/5=5D_wifi=3A_rtw88=3A_88?=
 =?US-ASCII?Q?xxa=3A_receive_VHT_SU_beamformed_transmissions?=
In-Reply-To: <CABOQOSVz0M4G2mzwtb000Ss86PjoTUwKvfoRQziLwY9DAqdNbg@mail.gmail.com>
References: <20261112173246.3201729-1-hjf3108@gmail.com> <20261112173246.3201729-3-hjf3108@gmail.com> <19FBDC54-7E87-4A8C-BDD3-E16351EE3CEC@linux.dev> <CABOQOSVz0M4G2mzwtb000Ss86PjoTUwKvfoRQziLwY9DAqdNbg@mail.gmail.com>
Message-ID: <C01D8CEC-AA71-48DC-8E61-E6B964865468@linux.dev>
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

Hi Jie Feng,

On November 13, 2026 9:20:57 AM GMT+01:00, Jie Feng <hjf3108@gmail.com>
wrote:
> I can dig the vendor code for some confirmation that the csi param format
> is the same for the later chips as 88xxa.

I had a look, and I think all of these values can be named from Realtek's
own code, so nothing has to be guessed.

For csi_param, bf.c already documents the fields above
rtw_bf_enable_bfee_mu():

        /* nc index: 1 2T2R 0 1T1R
         * nr index: 1 use Nsts 0 use reg setting
         * codebookinfo: 1 802.11ac 3 802.11n
         */

and the 88xxa vendor values follow it. Per slot, hal_txbf_jaguar_enter()
uses 0x0109 and 0x0108 for VHT and 0x0309 and 0x0308 for HT, so only
codebookinfo and nc index change. csi_param could be built like in
rtw_bf_enable_bfee_su() and then copied into the high half for BFMER1.

For 0x9b4, rtw8812a_table.c already loads 0x00000000 and
rtw8821a_table.c loads 0x01081008, which fits the "nc =2" and "nc =1"
comments in the vendor code. If I read it right, the write only changes
something on an 8812au whose efuse says 1T1R. Two defines for the values
would make that clear.

For 0x0202, the halmac headers in Realtek's newer vendor drivers name the
bits of REG_SND_PTCL_CTRL. In halmac_bit_8822b.h:

        #define BIT_SHIFT_CSI_RPT_OFFSET_HT_V1_8822B 16
        #define BIT_SHIFT_R_CSI_RPT_OFFSET_VHT_V1_8822B 8

so 0x0202 looks like a CSI report offset of 2 for both HT and VHT. On
8821c and 8822c, bits 15:8 hold the VHT category instead, so maybe
Ping-Ke can confirm how it is on 8814a.

The low byte has the same layout on all of these chips, so the sounding
values could use names as well. 0xCB is USE_NSTS,
DISABLE_CHECK_VHTSIGB_CRC,
CSISEQ_SEL, HT_NDPA_EN and VHT_NDPA_EN, and 0xDB adds BFPARAM_SEL.

Best regards,
Luka Gejak
