Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61F365192;
	Tue,  8 Sep 2026 19:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894298; cv=none; b=kKfMpY86jUtuIpqruKTWrirfKp/vlXoKqP6/UmJtNIEkSyithT9QIZ3kXQHu4Qs+Tp6gaUyI3jXz7CEQg/GzG2a9v2RQ7PXrKiM5JnOnQd2fEc26K0HctQw+HZe9ROclyqcrmbMaybxwDzIBJVeNEDduS0G3MZmItjs8B/CLtKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894298; c=relaxed/simple;
	bh=uvavREi5GaWkPlSSAjllG1HFgYNRidOlF6medB4NFwU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=j7TZyP429/dJoLLV3LZ31DmmfqKG5mIfUcJHsiP0EeZFzJ2zRYkZyS9RMc4z7XClkOUKjmrsrhq/PT0DomNvN8XMTw8ai6J8r7SgcPJo/TMPz9cppfLu1HU78onpBaCgCyOf/xE3MPuitOd6zPcVo2gRgP6j1JKpTqjzlkt1u2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kvTW2nXn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kvTW2nXn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED8A11F00A3A;
	Tue,  8 Sep 2026 19:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788894297;
	bh=nAlvhT9ZFVfUmfohNEsGAIiJycxNx79GkgwG5v7mMMM=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=kvTW2nXnK9NPn+KZPTaSpQw2CMzcjpxXCmhV+zAQ6KULwEikZwPiTFJcVOK2dYyq+
	 5wT4sV6KnmZ2T0O2M/oa34mR/goSmPjQ9Y/tZ0Q0YBsNGuQ1gClu0JoFjvBZqURkNy
	 QkPnaGf9beKojMen/LTiGSzqyx09/cqxQ2oQ6KSV3zdZbTUbTiXwB/uAqKdrWAAY/v
	 qOP+DhozJXFqcUAcQ+42mdOgXyzGJu/Ys6pvEwQGxZeXJXXqERDf5m6EW7XeYWtz52
	 s7SPqs1oaYy2ghXl0tggjejR8C+I5Dry7Njfu8alfchQKW4L1y3rurh8+pOm4U3ztI
	 vzUdIIxjdjvzQ==
Message-ID: <f6549175-157b-4569-ab97-ac9377d060ea@kernel.org>
Date: Tue, 8 Sep 2026 21:04:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/22] thunderbolt: Add Apple Silicon support
From: Sven Peter <sven@kernel.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-19-1f80085f93fb@kernel.org>
 <20260908091844.GD106095@black.igk.intel.com>
 <22808191-5310-4d90-9fac-68d0d85b4c54@kernel.org>
Content-Language: en-US
In-Reply-To: <22808191-5310-4d90-9fac-68d0d85b4c54@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> 
>   &dwc3_0 {
> ports {
> #address-cells = <1>;
> #size-cells = <0>;
> 
> port@1 {
> #address-cells = <1>;
> #size-cells = <0>;
> reg = <1>;
> 
> dwc3_0_ss: endpoint@0 {
> reg = <0>;
> remote-endpoint = <&atcphy0_usb3>;
> };
> 
> dwc3_0_usb4: endpoint@1 {
> reg = <1>;
> remote-endpoint = <&usb4_0_acio_usb3>;
> };
> };
> };
>   };
> 
>   &usb4_0_acio {
> ports {
> #address-cells = <1>;
> #size-cells = <0>;
> 
> port@4 {
> reg = <4>;
> usb4_0_acio_usb3: endpoint {
> remote-endpoint = <&dwc3_0_usb4>;
> };
> };
> };
>   };
> 
ugh, Thunderbird messed that up quite a bit. let me try again and see if 
it keeps the indentation this time:

   &dwc3_0 {
         ports {
                 #address-cells = <1>;
                 #size-cells = <0>;

                 port@1 {
                         #address-cells = <1>;
                         #size-cells = <0>;
                         reg = <1>;

                         dwc3_0_ss: endpoint@0 {
                                 reg = <0>;
                                 remote-endpoint = <&atcphy0_usb3>;
                         };

                         dwc3_0_usb4: endpoint@1 {
                                 reg = <1>;
                                 remote-endpoint = <&usb4_0_acio_usb3>;
                         };
                 };
         };
   };

   &usb4_0_acio {
         ports {
                 #address-cells = <1>;
                 #size-cells = <0>;

                 port@4 {
                         reg = <4>;
                         usb4_0_acio_usb3: endpoint {
                                 remote-endpoint = <&dwc3_0_usb4>;
                         };
                 };
         };
   };

