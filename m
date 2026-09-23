Received: from mta1.migadu.com (out-11.mta1.migadu.com [95.215.58.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC993D904C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154936; cv=none; b=cGgXi+tIgO8rWZ01jJZ7SW8qd2VUss4uyEFaCcamrqubxgNU9RJEQehhE42Bydl+nbPYVxiWS0wPt36v/ZduqyhkggAl+3GUSqkYpHlLYR5L5w08d8hsB4n/iTBEKueE5ba/HiR5EbvluXyzyW7wqD5ukvJ5FWsuqX7l7mBzvMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154936; c=relaxed/simple;
	bh=oaTRjCWZnQNokZg4Q89meVlVIFu2T26bZQvvNaVlNs8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=iU4WPhSiIKeNt9uyaXA4jOduElnIp2Sw1y2samk7WtCh+8PoXEY4JJwGzF1jDgNuk8vsOU9W3pG1xW5U19ycrXvzu1T2XTljxnH2HctMAOUZCR2nAvY10EC0R5564DZBF9Nf5p1TbLoVub6+GJh/KNMuLaVDVyoJMKjcVbJvBMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=fI2QyQv4; arc=none smtp.client-ip=95.215.58.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="fI2QyQv4"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=oaTRjCWZnQNokZg4Q89meVlVIFu2T26bZQvvNaVlNs8=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790154932; v=1; x=1790759732;
 b=fI2QyQv4EfRsBxwj/OcUEkQAJDRLwbIWZun5XU75ApKkTp1yPQUijN+ffutQ5J39kgapOMnp
 oQ5hflhY1HctPMJDkQBlIBNEhxJMRM23ZOaAv4KKt1qmcVsynsB3nMaQpEwr4ARK8PUNl44gYYl
 FLck4rvSHi8R1V9+84l1dL+riiJYepnBTRZTbzyTmhSkpIXqs706lONrKyVTqBMyYqcvpBx2GLC
 N+HBXNboHQNfWkF5tUj/WHzVSiRqDYBZXns//teDZyAyLZUayNR3NEMn8bxiD0Y2JmtcIwnoPxU
 iPWQj3wUszLIrF5WyLrqGn6ZpWYGUrpp6kEVkihUPdg2Q==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 342944e3381b851a;
	Wed, 23 Sep 2026 09:15:23 +0000
X-Mizu-Trace-ID: 342944e3381b851a
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 11:15:22 +0200
Message-Id: <DLMKYI79QQRS.28Q4ESQ974BU@cknow-tech.com>
Cc: "Tomeu Vizoso" <tomeu@tomeuvizoso.net>, "Oded Gabbay"
 <ogabbay@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Jeff Hugo" <jeff.hugo@oss.qualcomm.com>, "Robert Foss" <rfoss@kernel.org>,
 "Sidong Yang" <sidong.yang@furiosa.ai>, "Diederik de Haas"
 <diederik@cknow-tech.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, "Jiaxing Hu" <gahing@gahingwoo.com>,
 "Nicolas Dufresne" <nicolas@ndufresne.ca>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Guangshuo Li" <lgs201920130244@gmail.com>,
 =?utf-8?q?H=C3=BCseyin_BIYIK?= <boogiepop@gmx.com>,
 <dri-devel@lists.freedesktop.org>, <linux-rockchip@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 06/11] dt-bindings: npu: rockchip: allow DVFS and
 thermal properties
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Igor Paunovic" <royalnet026@gmail.com>, "Rob Herring" <robh@kernel.org>
X-Mailer: aerc 0.22.0-24-g39041fd9f179
References: <20260922080114.44662-1-royalnet026@gmail.com>
 <20260922080114.44662-7-royalnet026@gmail.com>
 <20260922160602.GA3529337-robh@kernel.org>
 <20260923085755.16219-1-royalnet026@gmail.com>
In-Reply-To: <20260923085755.16219-1-royalnet026@gmail.com>

On Wed Sep 23, 2026 at 10:57 AM CEST, Igor Paunovic wrote:
> On Tue, Sep 22, 2026 at 11:06:02AM -0500, Rob Herring wrote:
>> On Tue, Sep 22, 2026 at 10:01:09AM +0200, Igor Paunovic wrote:
>> > Assisted-by: LLM checkpatch dt_binding_check
>>
>> Drop 'dt_binding_check'. That's expected/assumed.
>
> Will do in v3. By the same reasoning I will drop 'dtbs_check' from the
> two DTS patches, 07/11 and 11/11.

Doesn't the same apply to 'checkpatch' as well?

Cheers,
  Diederik


