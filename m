Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793925260;
	b=xZGMishMsRJm4WlTO5gomfNtDaQqjXNg3w2aGGmswC1ONkHXYw+h5vuNjqcvUh1A5gCr
	 JmO6GVKoAAvQW+YLV/FwlZi/0QiXyrJl9ummNcWXtnEd0pDYlUAzEmF9GkJ3icNqzpQFH
	 pIWJeLmwIuRRF791kUr0MJY7LL9G1IE1Sz9C46ii8GHF7hRY/a9NEPZZF4dvPsL8SdX3J
	 rY5fjKPm9K0MfWiVp6OKCVamwuSvUTImhCPuMUXhzJcLBEaPvVe6hsVS1uStuZIK7hMMa
	 nACcZcSayk4iamiw/sm1b0hXKMQaqOkx0WHA5swwRn/5470/YrQl4OWySoySgh+nYJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793925260;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=OVyjMpKLjhA1Rj6kFt39fijzgKw1bkGZMKnXsd9NG1I=;
	b=Iu1Z3VdI9CoQ3A4cmD+F/HdHLcKhaqgVE69I4DOBoypR0ytxpy4YO2wHtWCYL4t8O07A
	 iRkUcrYmSAPO5/HQFYQrU2R0YMM6vIU32nOlfNDTYhy8IDXxnomih+VhUdST0fXk/BhRM
	 qeA6PyHCAEKbgGAYPMreI3vZGfV1z87i8n4rtK6gYtu3GtLBG0NSbizs4zIzdsKISEJTb
	 ZguMyCnPDoSK5dr6EBDt1Fsu/5rbkM27lGsz6pjquUG6JFGJMNrSoENH4Wq/NjZMx28UT
	 H5wJEPzlGKd1gNHRVlhE3TSeWm9/T5hq3xonSQ4A8oeJuAMM5kfThp8h3rgrWrqkhQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B64A606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B64A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd6a7e1f4e4so35889a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:34:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793925260; x=1794530060;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OVyjMpKLjhA1Rj6kFt39fijzgKw1bkGZMKnXsd9NG1I=;
        b=qbKYooLAjUIdCWjTwZQy5WvXIFZ4/joFWqSjy9rue0NNokNmgUxh0emuPGfS98eLGz
         s8ycXv6DXIAzyrGIqiHHJfwsp3m9NVnHNEOjbmpZn8KtER0NOmS6qMDmfSYuIqMzKqBX
         lTl87MbblaBt+2zUQxYY3HGnADINBlWMfMqXG6DsB0KK818fxG82jBzrdis4mb6rrHj6
         vJXu0ovuXxcqo5XC/ByzpCO6rtElUxBD6ZkSLzBAYg9zyfu9hMTxN69VVTF7WcGIYeuR
         YwXs18J/ekjo1IOd3TNBLJQXBT91rhPn/h2+Q+fy5bkhijWpKOSud5SdchB9NHBpg/lN
         f1ww==
X-Forwarded-Encrypted: i=1; AKwUvBx+BwghpeB2a4iFk+oS9xcR1vfmPNg5hWleq38CcReaSJvkX++fv1foLN/ayvErpiY38oupNw7RTkShG48=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UAWJxDpIgEKcbN+xxRyLRAJmK/igO0G4+xzV6ZDRAvTN/n7Ma
	ePrbLjvI4uXNnmDbITST2rd1xPiUu4aBBicse4cMIMsEohGusrPd6iQsx1oQg7eR
X-Gm-Gg: AYBFou358novxCRgZ5RoGo9d+gniZdeDcrucdtva95BnruTUfx7ygqjh/WsDEFuHNd2
	oUX5qPkjkypNj5h8fnbInRfS0DffR7uaxj1UxKu2nEz7rBeQnJTGPReJRn2yLiA+bVsqCxXbnri
	ig3eBArpR5wTpRQ6Q9cdqepY0vBBjc4JEaQSimt5TAFj8jBPyS5RUPXzjo8WCB0jBJz9OsEOt7i
	gK8pjvCYsYZ9DTVKEEWKS6/BMA6POhu7PbOr7ug8dHG3EEysKLXOkwMaWF0ijVZPsdAqiIqkMu0
	9q2Q1nQ6eJOnN4cW39D02kTLMyyneGacLbtPXyD7m5/23HQ0d5PlEQcQdhBiYRF0M6RY9IsZEK9
	78i+R5slB+eDCpbamUf0WZ8HdiwYS1xd00n9oi7MHgv13wnG95PDNUpnpMkPwQMlHS8fN5IiRRF
	C8xh9/FgAz9FqutAea6rqGB+2voGWLhU4C35f0kLE4sqhBVUJoA2c5mgT8Q8Ovkhn35FjV/XQha
	GnwQHeqCW85Wpk4lNPzB0uDbuiD6LRTRzi7uNjf+vG4/MWP6PFT3noLAL10CqKnEAhPsduq74Cv
	2OVSsK82PS8foMHdye4bxm3CoOJ/jZcJn6OMfS21WNjRN7Znyx98kRQIEhv9cGbW1O4sT1ctsFQ
	K3TfykB7YQHBgSYrGNgRgrUnL7NuhfRqxmKRYX/rorYSHXIfQp6L/W8y78bSBT5Rd
X-Received: by 2002:a17:90b:3b8f:b0:3a0:b312:1fbe with SMTP id 98e67ed59e1d1-3b0db6c99a4mr687522a91.23.1793925259754;
        Thu, 05 Nov 2026 16:34:19 -0800 (PST)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com. [74.125.82.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b096b52911sm4254954a91.3.2026.11.05.16.34.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 16:34:19 -0800 (PST)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3535a54bed9so121825eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:34:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByYtxL1h+P0J6nRwAfxz8MFGJnU9BQAI84ksQ21pSlTEtO1UpbjmzQ/xQ7AGYBd7MX1LnQil4jrEjSFe+c=@vger.kernel.org
X-Received: by 2002:a05:693c:68c6:b0:369:d84e:eba5 with SMTP id
 5a478bee46e88-36f75443f92mr1048026eec.11.1793925258726; Thu, 05 Nov 2026
 16:34:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
 <20261104-sf19a2890-sysm-v1-3-a4fac07df823@telaak.dev> <20261105-upload-golf-40927e20b7b9@spud>
In-Reply-To: <20261105-upload-golf-40927e20b7b9@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 5 Nov 2026 19:34:07 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5B7YhuQtqvFanP5GpfK0YvJ27xcS68KtK_rZvbxYN6dA@mail.gmail.com>
X-Gm-Features: AclHuK-ZB6vwHbkhfZNFAAIsLQdK0ZMK7LE0zya9GH_XZ9poNQEbizkJmf2GZbE
Message-ID: <CAPY4CJ5B7YhuQtqvFanP5GpfK0YvJ27xcS68KtK_rZvbxYN6dA@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: clock: Add Siflower SF19A2890 peripheral
 clock/reset managers
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> I think you should put these in a binding header file, rather than just
> put them in a description like this.
> I think you really need one for the clocks too, since you've got things
> like

Thanks, v2 will add include/dt-bindings/clock/siflower,sf19a2890-periph-crm.h,
naming the clocks and resets of each manager, and the driver and the dts
will use it.
