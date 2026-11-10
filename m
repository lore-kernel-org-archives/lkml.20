Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794277545;
	b=P7Kk7DW25VKQQ18JrpZI41HSJ2TkNrEAc+j1Cz7LlvtDBXlueStLCCBe0JSSn6FOS3ak
	 fGG2z6xet0iNNJVJ+VM6PC6gpjwolfCPHyu0tbL34LLySvIgVrfs9+ezp4Jb+j+4GEqLz
	 P18BT5WCj+m8VPJhOy6osd6Tk+n0YDs1Fwz7Yd6sAkTG/YOIeGnNJ6d8siqcNsjv//dak
	 sHMwg8ITf5fgzTUFqdJSddCChX+k/tbmuJKXfQ5+EUbcCb9LwHElI2BILPpWpT7LtRiVh
	 rRkB3EDM6TGGCOA79C/6eL+jPtZvINSNo+qAh7VZC1THPhjR/daXeAO3n67oZU9GX6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XPldadiNKhoZegiaTvf8CiokX5nZmrBDQdfxqSW4DgY=;
	b=HIQmg8zdagUxsJzYNcQSjeZxl6QHqRDoOlZM5NxTRUKODTkmRQm0QxeiaSULmf1dYOPu
	 6C94pXZhfP45k/Lmcp6APicwMEiMu0YGjOIzKzcPGagDNrFkwM0KONNU3eHJUAeByVFHh
	 GJNDg+U7rz3nkZhA4Ci5qZk4pJeTIjWK8vZchtfRx6tfSw0ig1Buh2JYw1leHQHv/XvkM
	 jf2si06qA2YZ0d1RBK8BiqwkuXu3DYkC6fAZCerAsw7Olp5442Uhp6qKn+vQ1Yd5CKG4o
	 oQyJfwRxzRqFPnz/sjOc2JKdITzZdgmI2EPlRtim1yTW+2k5I3nniAeqYoOl3yr3m9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ifJwtyRO;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154A7606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 154A7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ifJwtyRO
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3099454eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794277544; x=1794882344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XPldadiNKhoZegiaTvf8CiokX5nZmrBDQdfxqSW4DgY=;
        b=ifJwtyRO6Rvdzuf5RXRzy7ct3bd5CDyCkVxVZpgd3Ig6fwQCkbp9KCt3ko8KEqpJru
         +sCzk8uSSG7rXdzapbnIqrOGkYEaG+Df4Db5RHwWm1YItysfhd1KuA2eUZLvB7Kcba+p
         VbtAagVe/A36U+j9GgCSF0JGtBR6vM0GLoVzw1E3A8TSLNILkr8HKKtaB+wugRaeMxWe
         VVB8UH2KdAmUi9JLZlVDVhfCQUljK/+np0pHR+Co5sUEkvVMSBBX92wDgZ2Adyhf/UH0
         BLTWe3yxFuK6W/HoFJvfcm7TuhmK+m90MJgw6anlnCBS1u9UYKPWakerbUgz+FUgyg4n
         +xSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794277544; x=1794882344;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XPldadiNKhoZegiaTvf8CiokX5nZmrBDQdfxqSW4DgY=;
        b=Y1/olDrl2F0PKQMCVHcQ0VA5H9JxF+ODY4dNLOEv4PGpEVk/3xHV6ZrrHyIItzFzu4
         ofm/7vcFO7fzzPBWqB2GBuK8kq84u6OiOQQ3lK49rXVuwPuyUl2o7CiEiPxbXN4B5sYM
         FuwBC9Sah4uErfW/hhiV9GmuAZiY8TkPk6+GVy0m66I97cL+nRvWE3GNu7e37AJtHcn9
         qAMixtYVZWQu9DskjH+dgzer+bquKkEe4d3SO9yt42ozM0Fm7vewnKEne5qelWxKgv7v
         10jYATgAk9fpzVJauzw7F2O4PHywh7UsMswowi5RX8Igavcs1zeo+IJ2HHKEGU5BvcCH
         3Q6g==
X-Forwarded-Encrypted: i=1; AL+hErHETCYXvguq/SMeSHNYONkLUbDJh3DWsq6Br1yCfaunS/NPIGQLaD9Q0HdCBjPDCCCaRY0iU1376wyUO44=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ki4vr+u87vsLlDWRtqqHccVD1Kb4l8P4JotMLgsRl9PgVjVrc
	TaVOw0BoJlam8LEOMKiOsD1Sn8QsoG0Mw6dy6SoCK9CDkLD+dQOlK4UF
X-Gm-Gg: AYBFou34XeJ1Q2pAscqbczI6YrHScLOd5b1QFqn8GZe807umoc2nsVg5AuNxRWap96O
	uebXs3IbpkQ0uTj3GzrHE2EmLp66HSZsEq32hpNgL8ML15iTgA6vI1fPO1f734tHRhgmDsNDsTe
	beieEtQLZb5DsluL+2A+Sub+OxUCsjPxjricBpZ00caGAFzX3spHuTI6ueE2eMuhWRjz4N3JfAV
	2EIQwePlJ05C8vZRA7W34weJpYjmUSLwF/4QwrlJ2J0Ls2h6vBElYaCuAu9TSP5CDip2PaqsLwD
	MKCURuYo2irEo6UD6vtkuu2o7RLOAXOFdQScP+SRPyxEmdSgZT3Rwp/hkNOvCIK2RS4sqDcE4Is
	Qz+M1KpMfNLmWnlGNy0xsn+AaXB1C6iY9iKjlKPgMWzqt60GuNQh0yBzblDJE9D7Te38ykWqrv1
	7zi/RKCYMDa9V94840AhmNUYly9jf8phmg861jqsSf2VLxnZG2FSqau22f7Rqexutd8esdlQVC8
	34C5yUcBJqRQn8GgiIM95XKFA0/snTny57juUjxygrwzpYzc+NIRElbibGwvbBYnYOInr779Eu3
	H2oaS81hWcsbKKCluRMTmLRGJ0Tz70IitzwGp8Plms85A1qit90VrXqVwEbGozqxSxSGt6A=
X-Received: by 2002:a05:693c:894d:20b0:35c:85fa:5a61 with SMTP id 5a478bee46e88-37520215e02mr1487679eec.38.1794277543714;
        Mon, 09 Nov 2026 18:25:43 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:856b:460b:b522:14ec])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306casm2213095eec.9.2026.11.09.18.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:25:41 -0800 (PST)
Date: Mon, 9 Nov 2026 18:25:38 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Siarhei Vishniakou <svv@google.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Ping Cheng <ping.cheng@wacom.com>, 
	Jason Gerecke <jason.gerecke@wacom.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Input: add ABS_TWIST and support it in HID and Wacom
Message-ID: <avKAaJxlxE8gOYVV@google.com>
References: <20261110020632.4003499-1-svv@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110020632.4003499-1-svv@google.com>

Hi Siarhei,

On Mon, Nov 09, 2026 at 06:06:29PM -0800, Siarhei Vishniakou wrote:
> Some styli can report rotation along their long ("barrel") axis,
> commonly referred to as "twist". While the HID specification defines
> this usage as HID_DG_TWIST (0x000d0041) in the Digitizers page, there is
> currently no corresponding evdev axis code to expose it to userspace.
> 
> Because evdev has no MSC_SCAN equivalent for axes, drivers and OEMs
> currently work around this by mapping stylus twist onto unrelated axes
> such as ABS_Z or ABS_RZ. As a result, userspace input stacks must
> maintain device-specific workarounds to know which axis carries twist.

How is it different from orientation?

Thanks.

-- 
Dmitry
