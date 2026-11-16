Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850305;
	b=xV9klBtODXUlVTUMSZhnywUXDL/EeRFmH1R2VEThbtI6JoPZxoCPNfSMeWqKor+u8WcT
	 6TITq07fCrQ2TltBd0HlTX+UXoOoh7ICVamZp1tBFbTSz7PAxeAco8e5sLtR0hL8zyqt6
	 w2VOzavCNpZXVSH5BQSBvKMg+R1/GIgxRpgNlu6kxuJ2fdtg7yFdrT/TmPZCX5AVxp3/C
	 +PxwGHqSp4qPDHVBXFZVrrzqDnCi+7oIXPWAe7inoQKGzXVQl4Z2ABMhZB4jL9guYu1lW
	 wUmDnYd2YPNJ6SGABknlhImosvzT+sWg+54YKFLu4ORJ3rrFsNUsv4y9N1JzuTjqnzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850305;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=02WhvjwIQZgdQpPiQB/KPvgw5RxyDj/gJL3jCJh61ws=;
	b=BtrQC1e22fW8Dx/ZrgtIC3yZTDOQlL3C4ASPbdCm5u4ZpWZ/ijLdveMdrHts8d+xeabl
	 FO2CD6ElGxFFXheovDOe0mCfoPz5EkGHW/lf6mdFsOyB31RssTqdPFnldkgGbhLwRmDt4
	 AQaLLd6A4v4poZSFAuLupg5FGWj4fw2WWVjkLr1c4xa3Dv/iazJQl4BZipoABAAcGK5Iu
	 ulricB+B69EcK5CXmvLJ+4r54KLWT3E7KOILHStJR2X/dF+CsQ9DNKG955yu3ulLg9tPf
	 MYmeURKZGeAqJUrTcgS52oJuOwvU0WpMc1awkA5cfWY2GIAgLyOHsFg2M5x3n7/Ak8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZpWcLEau;
	arc=none smtp.remote-ip=209.85.222.226
Received: from mail-qk1-f226.google.com (mail-qk1-f226.google.com [209.85.222.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D86606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92D86606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZpWcLEau
Received: by mail-qk1-f226.google.com with SMTP id af79cd13be357-94959217274so460597385a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:31:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850303; x=1795455103;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=02WhvjwIQZgdQpPiQB/KPvgw5RxyDj/gJL3jCJh61ws=;
        b=xhwvTC1w9C10u6zgaE3JIP9oo5bPsE5vS44i1c0XmUAmx7lE1QhkrufW0je+Qa5IU2
         1iRRLw1zXwUwqaWQ0SBTdEzgq7ncoHHNJ1Q3YKDnHB2sRdosMzzbevjMHYfvpLYnCoKp
         Zu6W1kA2/tQ75okD5tKXd9UwBUxS6qNVTxTt9XHOc8bM9UFNcgiLi7qdfX+YmQY40gcl
         EqKiOQTJNXWf8aNoE8LjaOgPoOVlY8XgRiPLAwpRfvNg2DiqYrZJmxYdglsHsrxeA7XE
         4F77aYJt4AkDdMaQOwPGV4f5ebNjLHGYFkEFdy6E3UwQDkcxO33kyu47iXCVvK0ebrVP
         mnnA==
X-Gm-Message-State: APuU4Z+gCYaEjC1hm7d2JnwkTaXW/qkCZKU/KoYN/LMaCtwI/6G8SDas
	ndEyTrMStfuDQbjLoty2cQMlHX0aN0Z9iv865v1gsDQnFs5VCHQagMaCmHUArh/kBdI6PHTWwr5
	CfWzusrsWAJDUpMW+/7fK5X5X9DHcbBN39Sy6ifOH7WKGpAURRpBkqvAtzESx20xq3ntKwgfqCA
	xIOUwTWwAdkBLIKzFHfFhfu7xdSU5f9848dGRZvGM+W5IsSe2+OUHddujnm7Gy0QjGp4PT7M13q
	07EIE8FSvI4IbOx53DlILPo
X-Gm-Gg: AYBFou3OOrhIzUdlm/ultBIYn5fYvfZqCLsZ0SYZmyTMyr8SD4tsDz+e8BXQrMNG5AS
	YNYREn8d6si5lpXfL0vsI2aMiaLT2rz+DaZwDNIpo5A0/a43bhf/G95naiREDIOoXhBV5NgUS5I
	oH+GaonN05ENhoDi5ivXuxj2ZSsmLDHkQjFTzciJc4nXg3cRPsfQr5HkNcoPSRZus+KgvH9vjr0
	o/31R0g1UVppQx9TsfS5KBLUzYg3IZxr/cVXilFoiScctmccjhxO4bNFyY3TQk6d/+EZcnw497V
	aJmHBnNSIqmoaxeZX8J0wNsFam5EwssxJr9Hr0VNzblgyuOHFbnviDO95h0pgqc46vt0woacb8u
	ueMhOYFW2/bNjCFmjXYI6qbAp4eF/JYMacEAZShA6QF/0d2LJWxaIfGQQL9TQQEjYMxrrEpbT0I
	5G3IhPN+R2kstlInzXjsr1CnNEkbMSK2ulhjlWU+44
X-Received: by 2002:a05:620a:1b90:b0:93e:bcbf:4ad with SMTP id af79cd13be357-9494bbbdf65mr1556934785a.33.1794850303496;
        Mon, 16 Nov 2026 09:31:43 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-949622ba8d2sm57212585a.6.2026.11.16.09.31.43
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 09:31:43 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc10da5ad4so627119137.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794850303; x=1795455103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=02WhvjwIQZgdQpPiQB/KPvgw5RxyDj/gJL3jCJh61ws=;
        b=ZpWcLEaucvCwpKNQMVrywasFF/BJdzfKfz5jraQmtvzYV9TJwbCdMGFCPAjSLgG+pQ
         wfd2uWGbjoOG0fVuV23lWYSPhX2SQaM9F3+Wv5NHuL3PyaLjneW42dfSCid3beMVjKLG
         JlYMjWZmk4XIsMMYWlJ76k/ab2o1Kp0vXHsas=
X-Received: by 2002:a05:6102:f12:b0:7d2:8e49:f90e with SMTP id ada2fe7eead31-7d64d84030cmr2982895137.27.1794850302604;
        Mon, 16 Nov 2026 09:31:42 -0800 (PST)
X-Received: by 2002:a05:6102:f12:b0:7d2:8e49:f90e with SMTP id ada2fe7eead31-7d64d84030cmr2982852137.27.1794850302111;
        Mon, 16 Nov 2026 09:31:42 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d69e07923dsm426460137.9.2026.11.16.09.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 09:31:41 -0800 (PST)
Message-ID: <0d7248af-3766-47a6-9150-ffebd6d5c501@broadcom.com>
Date: Mon, 16 Nov 2026 09:31:39 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/14] drivers: fix duplicate extern declarations
To: Safocl Stollmannovic <safocl88@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261114165612.368785-1-safocl88@gmail.com>
 <20261114165612.368785-9-safocl88@gmail.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20261114165612.368785-9-safocl88@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/14/26 08:55, Safocl Stollmannovic wrote:
> Compiling a kernel module with a C++ compiler results in a "duplicate
> extern specifier" error.
> This occurs because the code contains `extern asmlinkage`, and `asmlinkage`
> expands to `extern C` when processed by a C++ compiler.
> Since the code already contains sections that respond to a C++ compiler,
> I believe it is a perfectly valid approach to gradually move toward a state
> where kernel modules can be compiled by a C++ compiler without any issues.
> The `extern` specifier must be removed.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=222257
> Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>

I applied v2 which was not different to this tree:

https://github.com/Broadcom/stblinux/commit/0cab822bca7a59667774725b83e948b71462290f

the subject was reworded because yours was not specific enough and did 
not match contributions made to this file previously.
-- 
Florian
