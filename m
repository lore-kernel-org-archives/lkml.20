Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794053579;
	b=lr4EqSqf0XeLFfAjbr3aopzDeGsU0lSoUAvPntOHmHz8kYK7oP8taciHE15M9wC1FZFC
	 qzfk2lOdvoZWB16Hhl1j6HT1ug/hZTicwMkxCEkZHzX6TMakUFz4YsqXyqG8U0m8w888i
	 +AhGl6mWtd6U/padd6gh+AsVhOndI0Ms/kXBhpxFzV44Ku57JRJB7rPAaUPru1RkKkFHW
	 etNYxJFCckH7Az8jSkKgYLownSMLxz7PY4xE3VyjWkfDIiHznZoZv9Df0hWwdMIzNk3Lr
	 khOwEtNrJ5oLJYUelXBK0lAAwzZ1Azp/ak03hvh0NivyWq0V3XCoy9SQ9qvK+gMH22A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794053579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8AKXFeIePEMVcJ8WcbZFsZCRz/PozvJrUX2BHGSj9aQ=;
	b=Aqy62Nm7e1/MgwTHFNO8zJo13hVVAvDq9jd4S2NKjJivueKMyPx40gYyqwukEkcuOYHd
	 RKoBGMTb+HxAZpw1hh4jQm4D7eZ4LfnOsFb4QWFSl0b35TAodVW12GkD9feHBm65UKgwj
	 4tiH8E5vGEc8bK/XnhwVSWDnefirajuGQj5dc/ujXqYo63SQOtnysSnzveLYxfq7XQVtC
	 P4SdR6Exonp7TQ+/ms7kNmooHey9Q7sUk455w/+/GM4GuSaDnbnyN8pEU4hX8EAzrKu5m
	 dZoeVEnt5H58VDn/8RjmnbyYRQpKS/CamT8lfWx0TNJ+G0FwxDhVASbudHc64+zq1NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U0s9pvl0;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A3C606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2A3C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U0s9pvl0
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33fb4680717so3003442eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 04:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794053578; x=1794658378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8AKXFeIePEMVcJ8WcbZFsZCRz/PozvJrUX2BHGSj9aQ=;
        b=U0s9pvl0vgg/uCdJfx8ktblDNhNECzkqCf421S6RCOyXCMkCLYCEL4IRXyQZXQ4ZGQ
         ZT5mNpNLPEwHkBUxKDtcI5vV8HpbNqnvSfwb1OE0uNKjQdXn5Sg+3G/RMTJFfwQTw0jK
         1DMnZrHMq7xHlxYysWGWph+xQx23R8l6aqxft3CRcrUzybgtz6oPMThxK5qTF2A5GCZx
         4IfhbR0/+y/IMcvkIblfzHwYTj6E9ODtgfjfussfaN9MTY/t+HuzQBrWyLL4DC1kIuV6
         WCprWkzMU7i9szSCH6nIraAg6uTOrJZKjR1L8/ttlagsJysHuWGASvV5Qzh3s9Av24+o
         MMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794053578; x=1794658378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8AKXFeIePEMVcJ8WcbZFsZCRz/PozvJrUX2BHGSj9aQ=;
        b=cNTwlnK2da9WfnbW1WwhtgzuM9szn/Y7iz1PYjIH0QjoLreeEhdjDM3TnSEunCNahg
         TRT2SPudR25a91pcndnZfiVILymacpUUqap8Kya7KqqmtRQPnQLRU/gvNtUpxpCSZP+Y
         0sJcbjKruW7ubGxjoeWoZ7PxhgnNvQhs2Y4ZiFoD6+b9aMUR91VgQCOoi8Ym3EsTedK+
         TRv8ZMy8qOBhYgdWIj2DzEZfSCBu/OIGOdbWUFwWGvfTZ678zYrxxFHcAnarpTwyHp7m
         xVhyoYx2JseeG41G0EiFBHRekdI4teq6IOwZUCdz8Re+beT75J1Cgx20jOBSPLe58ar6
         /sXQ==
X-Gm-Message-State: APuU4Z8Xph0syrK9fMOYlzi3dOvvv93S6BQyGv+bzNBlVoH4rGOmQSTS
	QoturxMQ1m+PV6DnP3dX3WzmNc25x1XgKLukoe1107pLu15GOtg+E0FA
X-Gm-Gg: AYBFou0MyFePl7Dm8zQWIcKhT53pdjqEDYzUDfPj3L1FlPdZJqqUFydz3nGkBWivdZT
	e68G7CRRpPulDxmqJ8h8OImOgifu7SEeOUyWLpOewlF9kPY0DDRQuaf5LSrcD1LOH6suz3UfUDb
	YddihCzRbE9L06Uu4hr8tCRnn5CYi8i+5c0MN6QpksIQa4mXQx4GeCmpVkfcbYjVrJrXh6djHxT
	+7eLQ/OFTGMASyhRR2eU6u6YzQiec6poSGpo6b7BcnC11/0RQVMQRUp6bA6cW3z4UI4qvFgUbE2
	guLzVjuqR18KKQ9QRghR2WCjUM06bn3RJuhYSiApcMVXKGiwB+veUL9mbccaQ3lMTjrd1WKhUnG
	Y+NZp9kLAaemY51Yxqx7N41ULPoU4rF8s2imJL3YxYtHAsimXuIFpMOZC269t6wXh8d3o92s9va
	Ig29IpPFw3sSrCn2xnQoqwHn6fQfBse86KxAkI8P0g2/DIqODSinjSR420g84j3Z4/v8jWOj+pF
	ES4nTTEEaEV0RhG1sQ8CxfE7IRYc8LtK/Z76QbqN9HnuRIJ/GFcshubmNelmB9/8W0MeHKPzlGu
	CW6EQF28s8uF96ZVGmi6J9a+ff81K80ETIk2aSKS1HaNVVFDCURf
X-Received: by 2002:a05:7301:4701:b0:369:f0de:259f with SMTP id 5a478bee46e88-36f76c170e7mr6611322eec.35.1794053577701;
        Sat, 07 Nov 2026 04:12:57 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9fce02csm16721778eec.22.2026.11.07.04.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 04:12:57 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: control: Synchronize LED mode accesses
Date: Sat,  7 Nov 2026 12:12:35 +0000
Message-ID: <20261107121235.3521-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87eccxyplk.wl-tiwai@suse.de>
References: <87eccxyplk.wl-tiwai@suse.de>
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

Hi Takashi,

I would like to kindly follow up on my first patch.

Could you please let me know if you have had a chance to review it?

For reference, here is the patch link:
https://lore.kernel.org/all/20261106162357.3616-1-sreekuttan2156239@gmail.com/

I would appreciate your feedback whenever you have time.

Thank you for your time and consideration.

Best regards,
Sreeraj
