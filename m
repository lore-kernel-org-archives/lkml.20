Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.78.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792931073;
	b=c2AOwAXXubW9y4sJVwfTosTT7mSFLWGwQx6zO+Z0KM3Y9w+1f15IJ5ORGxrQVYUqaeRI
	 0NncP0QwAW0gFXnPiOymyZHi1vT2EXBJHIz5+boZGjH5qL6gdzZkJXVIb/anbR7nxbT2G
	 z3xBnLCRXFh2bH+RMxhV4QVXUquDmffseiIt4sTeqjOtD7B4OVQpnqOnUgy3RBHBATlc1
	 pfXPWw9lNCP/v6+zXLnNfG0PMu2uaGPlyG+DThjmv+ICcq0aB+f5ufxee1wkn0wMYnXcc
	 5/hRzT8OaqVPDNPeFL2nRUQj1Qw03yiulii3WfWgFD2JqTai4W4RwOmQee6OxqGSr1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792931073;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 mail-alias-created-date:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Info-Out:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:X-JNJ;
	bh=G9PnTYGt5cIFS5/QBfn2BHe94Zz+eSo3HCSqmXZsUis=;
	b=kHz+T7/VcDDRJJOtOiVlzVFXDCw008KNWF1H8a5C5xyzkQnrGz16bG8x8S04CSIa/mg4
	 ZxoFqUInfXm1eewwtAVp1T5rY+2KqvLgbg+dedn8fudrFfzoWmZPTWeRWWQO/RH30eX7h
	 aC1UX+YhxYEVFavpcYNPKSj+Z0MB7ovVAp0IJAk0G+exiSRFEX/UliS9AEOtDKxnyXIz+
	 oSgtmtwifcERQfRg/fDBBaxsXMKT/zCNvvKCmcTQu8KEjTN2RR5BLngZD6IBpy5W4sXxu
	 Ho4HwOCras/WxlvmDc02c/qjQ12FG62ZbEwv/38fIC6eZtme+JR1opGeygxYfXxzGPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mennemann.net;
	spf=pass smtp.mailfrom=mennemann.net;
	dkim=pass header.d=mennemann.net header.i=@mennemann.net header.a=rsa-sha256 header.s=sig1 header.b=HDGTjyKM;
	arc=none smtp.remote-ip=57.103.78.7
Received: from outbound.st.icloud.com (st-2002a-snip4-4.eps.apple.com [57.103.78.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752FE606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 752FE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mennemann.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mennemann.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mennemann.net header.i=@mennemann.net header.a=rsa-sha256 header.s=sig1 header.b=HDGTjyKM
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-1 (Postfix) with ESMTPS id 51F71180018E;
	Sun, 25 Oct 2026 12:24:30 +0000 (UTC)
X-ICL-RepId: 01a17305-0112-7a53-a2e1-109895e024c6
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQhPC0MFWwNeC0gLQwVaAFBcHA4AVhlRGVc4XghZBVcdWBZdQ1kORlBfHA4AUgVcFVQZXQMZBVcEGQpQUAFLWhVVFw4CQh9QH0wWV0NEHxwZWhRcGFNFUR9UWEMZRVZpQQtPHV0ZWxxCZFhXCQoGVx5XHV4MWQUcHlwMEwBeDw9MC0gBWwZbAEUISgFZBlocQQ1NBl0aWh8dWApQBFkrXxVXFlYAVgVcXlcdR1MXH0sAXEVQGEQfXR1mHFwAVgJc
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mennemann.net; s=sig1; t=1792931071; x=1824467071; bh=G9PnTYGt5cIFS5/QBfn2BHe94Zz+eSo3HCSqmXZsUis=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=HDGTjyKMDEy5iIW+OJC5Je3zYydBPqJUEXSwHA4dKgv3nor0eyQv9YhThIAxtkR7X3xUBCbCvaLFs2E6uEiTz8fqG2EO1PZB1f1UJRnnHyz7/WQofgjXRL81DhPuvjRznuaZWO8SZSBN4om/Kqn68sfNGwMpBn8KlkGh9hsqDt52rB29hO6Zsv+wV0KtIZj/VojO9fYTVAcTDArp9xWcSd7sHHQkwcoRybbbYzxsJcvIr7CNSsubGqEt1dUxQmqvktig8WcPl7Ydc8B3AsnNn9QSCIXADdTYQu+8wKAxyzuYFvnyffAnpCz/ne6Ekty2MFtCnCl6/LSgcVcg4QPaYw==
mail-alias-created-date: 1719251376433
Received: from archlinux.localdomain (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-1 (Postfix) with ESMTPSA id B304B1800198;
	Sun, 25 Oct 2026 12:24:28 +0000 (UTC)
From: Marcin Mennemann <marcin@mennemann.net>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Senjin <senjin@hatchling.org>,
	marcin@mennemann.net
Subject: Re: [PATCH] fs/ntfs3: fix SEEK_DATA/SEEK_HOLE for WOF compressed and dedup files
Date: Sun, 25 Oct 2026 13:24:11 +0100
Message-ID: <20261025122411.14550-1-marcin@mennemann.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261005223318.19303-1-marcin@mennemann.net>
References: <20261005223318.19303-1-marcin@mennemann.net>
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
X-Authority-Info-Out: v=2.4 cv=X6Vf6WTe c=1 sm=1 tr=0 ts=6addf4ff
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=Y3k0dO8rAAAA:8 a=T0gKZLgf3h4bJD4k0QUA:9
 a=Vsd_HAn_fMcgZoXZC4y2:22
X-Proofpoint-GUID: 61A4-thsRtX51QEt2OGM8FtXUQnc_H08
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDA0OSBTYWx0ZWRfX0lA/WOaDJdXi
 FxCWqEJjpq3f462E0dVTKrEdjJIRCy72MnaVGBS1wAg7z+NN/8k5RCC4jRO4YfmKmkK8dowogec
 NJNuqC4xTnd7+LIeJb/ReifTDBKDB+el39XaGJTThR3o30G1VjULyyEwuW/ivRy5HmVdO5/HarA
 e/O0OJiBHOb5pb3tXeSchPzzUKrAZAdvN6L/VbhLyTDQ4kaqE1JxHe5Acph6TYEODWuZxLCEQ0X
 NuzSoiF/L/6rMkMke52LwN7g/lylUlL7906OckkmoL78/GMqwEzrvq82n38q8HmHt/l85zYF0c0
 3HEGR5CreYsQ1GS2u+KQ5SEwiNSRcssWeJIK7YuYIlrp/RDTw3Epb1DhmlCz34=
X-Proofpoint-ORIG-GUID: 61A4-thsRtX51QEt2OGM8FtXUQnc_H08
X-JNJ: AAAAAAABe0xD99npd/L/diIe32U0SdcD3JlWU9DjQLCvAAgm7cO9IM9jj8bDHU9ZSzMmGnpt8fw+aY2Lub6junFjdHbEHPIKJaR8XmdxUeCnVUznVKY6ieUnhhhaOg5vJNT4jmulARbJWQBtRi70VYM6rpoBZwftHJf6B3VzZvMeUyrJDRqoyUx8dY8G9dSQKUf5FqpcXIqbf9uMg5Eqyk7P9zpSPpp6pt+x8VhVaGoRQM8PozcrMrQl2Ryci+kJrg08MYXOgfeDfU8h9WScQMOJEaa8WL3uuvl0DMhVNIQp6IVhhwGgQl0rYCw3B6bjQ7bXv8rXEaIYd/KFQs7Oo9MlL6QPiO/17ev1QxgpAyzMxo7x80qjcw/7Dkbl+3kIZuA5INTxpH7RLTLn3WvgPJCnBMGz75wp0KT8kVgbsIa8hMy5gxPz3JuaCYgQTzc+zK4xUDCLwkoxxcIbA1muGi2sYf+3K9aBgORnnH0j7kYQbbq9R85mWfVAFkBcb1nPGU/SL2teMqg9d3fqmWkVz9uLI60HQR/AigRXjPpO0xKJST7zIQXxQ6ei+azq7xVxtrT8U82ySfcsU9nRH/gJTFpiDvU0V2ypmXEVokO81R/3ssdH4WS9wmX1c+l4EXcinavhFOm3Mg7Sg/Q/DEhV7Ao/E3ET/GeakqwBHz1WgaBOnthj87ky7B4UAp5uKH23wTdWYe/EeV0fotnHUjjNPhzEe9f4msA1ZuzFaGOpVmUD7FEz23bqvRnnJBYNjmFfJGIe0qNzl5GtDJaR2gACoQ4eP+cp1m0oDLX0MqAB0WfRoenkdTgphQst8T3uUpXcIgmlQ1lZ4dTX2S9yj9IL8j2TCsQc9dgVLO6yf8qPkSwudNJ/dHVLIFfTxIfTfRDquBTff7S4NGur0ghMDUmklD+n1TPfhcAlx1rvkUR0iqSWoCpELyZTvAYBVADU0yj7Ss7dMZ+ZNIQoO8AXClek3BUx0apcGD4
 QNztOYNM4tU2FrK5il2Lh/IFFDBHHqioLq7OlUKHYsmcsSn+uO+NbBnvQZ7jLNMDgvco8OD4Ob6bzH8kQzCSfPxBo1BSizWhDhC3YnMjZAOlvc98kf28OuI3GWU5AJ/LHYG8BBvSufcqHkvgORaI1Mdb1G7d7n8xN4gbz2TG9/LT5QrMXJ7QXMK4xf2Ucj9+BE4PocJK4MDt/A8D2prrPCSlTtbRmbX78O9GsmZOEXI5VM6vQat0oIEy5xemadixHoEsddlYW+sf02jVN4FLFwegKyTj3rOwQa3iE7JUIUatiahoY8YfOXrYnixAaFFl6B100JWJSnxsq9S0rq4b2P7wBaLXm

Hi Konstantin,

gentle ping on this one. This is a regression since v7.0: before
c61326967728, cp copied WOF compressed files correctly; since then it
silently produces zero-filled copies.

Senjin has since posted a fix for the same problem [1]; either works
for me, I just want to make sure the bug gets fixed. Mine also covers
deduplicated files.

#regzbot introduced: c61326967728
#regzbot title: ntfs3: SEEK_DATA reports WOF compressed files as holes, cp creates zero-filled copies
#regzbot monitor: https://lore.kernel.org/ntfs3/6adc95fc26efdd1658b01fc5@mailersend.net/

[1] https://lore.kernel.org/ntfs3/6adc95fc26efdd1658b01fc5@mailersend.net/

Thanks,
Marcin
