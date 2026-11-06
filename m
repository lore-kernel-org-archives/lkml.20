Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.34.240.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973894;
	b=E0ql6NKAwvZyYwpQCWc7f3U2M8hl0MW+ekTJZNyvt20aG5EACKqsg4OeCeLzLluZhoQK
	 V6aGQu21fF7+GJoZ1fGD3P4EBP3z1h+kteQ9d7GuEKR7jKF8vJp+1ev4qRGRv872IaS6F
	 h7JLFEuUyJ4zg+gbaISy3WfONgz+V586DSsQbXRN7AKTEW5jw4JP8fH6Mu9e7JGKHjuPz
	 4qxTIrWxfjtTO/eT6+fdCq+qrLK/1H+WaFxcHRTpJsVCmWY/uWLBwc+bdsmW/H5BPe4Wj
	 iisjNIi22/0iUsaRq0JvxqBc6t5g6ZMf57Kny810mRiMQT9eEU8QKuiTtAnVSScxzjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973894;
	h=DMARC-Filter:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:
	 X-MS-Exchange-MessageSentRepresentingType:Date:Message-ID:References:
	 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-Exchange-Organization-SCL:X-MS-TNEF-Correlator:
	 X-MS-Exchange-Organization-RecordReviewCfmType:msip_labels:
	 Content-Type:Content-Transfer-Encoding:MIME-Version:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=Ua1mODhM/8D5RojvHEx0p5Wrn1skZyRKhmF6dD7wVNw=;
	b=Kldu1WqK2UJvNOtwUXkeVd8N3G0OjMjJdpVYFvY6eutdzofBvxPnS9t+mWN3nF5F+iKk
	 RZG1oSD7px/s9YCA3cDg4eUmrpz4/wp0WrKIBRXG/nCOVI8LSD2Fb5MpoF5DicuQrh1+K
	 kMR/G5XLkzFrAgoXaej1A5rslRnkYqVHKjWA3up17g3ClE3tPSHE9n9Nj/Bw6tNZwZz3t
	 zel/Rn5+2OPgZLJN+y0t9+v2g+4e1SrABciu53DE/P47+MQCeudg74aTfK3tmqPY1D63+
	 3pfmJAKFRaJ6XGaU1VgO0kahFigfjLpXz1bojmqD+5qNkuw4/nw6GAmBWjF8GqmP2QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stu.hqu.edu.cn;
	spf=pass smtp.mailfrom=stu.hqu.edu.cn;
	arc=none smtp.remote-ip=210.34.240.11
Received: from hqu.edu.cn (hqu.edu.cn [210.34.240.11])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8BEA606A32C;
	Fri,  6 Nov 2026 14:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8BEA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.hqu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.hqu.edu.cn
Received: from TYZPR04MB7491.apcprd04.prod.outlook.com (unknown [40.99.89.157])
	by cmweb (Coremail) with SMTP id C_Ai0gBHmIVm3u1qfguSAA--.16551S2;
	Fri, 06 Nov 2026 22:04:26 +0800 (CST)
From: "raspberrykan@stu.hqu.edu.cn" <raspberrykan@stu.hqu.edu.cn>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Neil Armstrong
	<neil.armstrong@linaro.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>
Subject: RE: [PATCH v3 2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
Thread-Topic: [PATCH v3 2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
Thread-Index: AQHdO5BowOR8ZCfYp0qZMi0lItJW0ba9+JkAgGN+mlc=
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Fri, 6 Nov 2026 14:04:16 +0000
Message-ID:
	<TYZPR04MB7491E5F7FDBD54FEA44C3735FF762@TYZPR04MB7491.apcprd04.prod.outlook.com>
References: <20260903-mibox4-dt-v3-0-1a8e395d923c@stu.hqu.edu.cn>
 <20260903-mibox4-dt-v3-2-1a8e395d923c@stu.hqu.edu.cn>
 <94fc2be2-01a0-4d3b-8d27-a4c42d8449d4@linaro.org>
In-Reply-To: <94fc2be2-01a0-4d3b-8d27-a4c42d8449d4@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator:
X-MS-Exchange-Organization-RecordReviewCfmType: 0
msip_labels:
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:C_Ai0gBHmIVm3u1qfguSAA--.16551S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYl7k0a2IF6FyUM7kC6x804xWl14x267AK
	xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j
	6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr
	0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAa
	Y2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4
	A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY
	1x02628vn2kIc2xKxwCY02Avz4vEIxC_Xryl42xK82IYc2Ij64vIr41l4c8EcI0Ec7CjxV
	Aaw2AFwI0_Jw0_GFyl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
	GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
	8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4U
	MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
	8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUxdbbDUUUU
X-CM-SenderInfo: ysvskiyqsqlko6vw3hxktxhvlgxou0/1tbiAQATBGrO4rEAywAHst

Hi,=0A=
Just a gentle ping on this patch.=0A=
I was wondering if there are any comments or suggestions.=0A=
Thanks for your time!=0A=
=0A=
Best regards,=0A=
Raspberry Kan=0A=
2026/11/6=

