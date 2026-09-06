Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8EF140E5F;
	Sun,  6 Sep 2026 05:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788671590; cv=none; b=TmYeiYJT7ugyw1U6Qn9EYDrQdddegQwrMm5hilUWDr39wWOB8wXBuZ7Hyb7fagPW1T0DQbsts9oVVAtV6K1CkRLoI2I3GmW4he5+0x6DrC4pUjW1AR9lId8GE09EqdAwztdhiqzSl/8UkVnqAUzsnfQxudNbowMtAhtC182HQI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788671590; c=relaxed/simple;
	bh=fQhKEDUQlnvdVuf41GV9U9bE+YzuOuU/Rv6HqZ/2hHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JOw3usb4iWohbYFk7ym7WIVFN4LXBWjcWNQurARTR1IFP0jRWnu9clBMYzkI0a8cox5YQHfqQgGu2pVI4zHDoZKjZGngmck7QscbLZHkCYnOntPu97oqgDxVk30ckIzRp00iYPOHg897QjZ43+DuqGysJ0PRmwFzmRX5vzC+ESg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kmUqBDJK; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kmUqBDJK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=v00C6G4+vUG94ot1BoePP2klSPMmGYmd1QrEFLUBzpQ=; b=kmUqBDJKSYhBP2v2DN8UqDQ3gd
	BSaTTJY7HD21Nx4x4x0as0QZXYmlQxd7wvBF5bbNETGoEWasV3Sr5n+s015dnOgOpdKzVen5Rivi/
	b1S1rzwSYg1OOQtMKrKB+qgLdt7qxlBO/KIu38r1GADGGJEzw8q0PhHJD+maJ/irMrTZYAY8DmaWk
	qYeQdVPcdreXDAF6gRbU0OmbwAvroj5tspKCzSn6Q3MfJXSmeF+vQivhlMNbmqDRpqopR94u1FC3P
	GhOlXrVzrfw/sVmwybrcj7sVBTVJskXiAFiHfvYF/jkmk60nqdPu0r+0+PX7d17tdAgTjqA9Uotag
	VYoWXhMQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x35BM-00000004hpC-2mvt;
	Sun, 06 Sep 2026 05:12:44 +0000
Message-ID: <6168d40d-b781-4abb-9be8-ecb25b7688d5@infradead.org>
Date: Sat, 5 Sep 2026 22:12:43 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] uart-routing: Add UART Routing driver for StarFive
 JHB100 SoC
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Oskar Senft <osk@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Jani Nikula <jani.nikula@intel.com>, Vitaly Lubart <lubvital@gmail.com>,
 Hanjun Guo <guohanjun@huawei.com>, Andrew Morton
 <akpm@linux-foundation.org>, Alexander Usyskin
 <alexander.usyskin@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Breno Leitao <leitao@debian.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 James Morse <james.morse@arm.com>, Paolo Abeni <pabeni@redhat.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Dave Penkler <dpenkler@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Dan Williams <djbw@kernel.org>,
 Mukesh Rathor <mrathor@linux.microsoft.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Alexandra Winter <wintera@linux.ibm.com>,
 Julian Braha <julianbraha@gmail.com>,
 Karthikeyan KS <karthiproffesional@gmail.com>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org
References: <20260905102901.126035-1-changhuang.liang@starfivetech.com>
 <20260905102901.126035-5-changhuang.liang@starfivetech.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260905102901.126035-5-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/5/26 3:29 AM, Changhuang Liang wrote:
> Add driver support for JHB100 UART Routing control, allowing runtime
> configuration of RX muxes between UART controllers and I/O pins.
> 
> A sysfs interface is provided for easy checking and updating of routing
> paths.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../sysfs-driver-starfive-uart-routing        |  45 ++++
>  MAINTAINERS                                   |   8 +
>  drivers/uart-routing/Kconfig                  |  13 ++
>  drivers/uart-routing/Makefile                 |   1 +
>  drivers/uart-routing/starfive-uart-routing.c  | 192 ++++++++++++++++++
>  5 files changed, 259 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-starfive-uart-routing
>  create mode 100644 drivers/uart-routing/starfive-uart-routing.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-starfive-uart-routing b/Documentation/ABI/testing/sysfs-driver-starfive-uart-routing
> new file mode 100644
> index 000000000000..737afdf428bc
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-starfive-uart-routing
> @@ -0,0 +1,45 @@
> +What:		/sys/bus/platform/drivers/starfive-uart-routing/\*/uart\*
> +Date:		August 2026
> +Contact:	Changhuang Liang <changhuang.liang@starfivetech.com>
> +Description:	Selects the RX source of the UARTx device.
> +
> +		When read, each file shows the list of available options with currently
> +		selected option marked by brackets "[]". The list of available options
> +		depends on the selected file.
> +
> +		e.g.
> +		cat /sys/bus/platform/drivers/starfive-uart-routing/\*.uart-routing/uart1
> +		io0 [io1] io2 io3 io4 io5 io6 io7 io8 io9 io10 io11 io12 io13 io14 uart0 uart1
> +		uart2 uart3 uart4 uart5 uart6 uart7 uart8 uart9 uart10 uart11 uart12 uart13 uart14
> +
> +		In this case, UART1 gets its input from IO1 (physical serial port 1).
> +
> +		To switch the RX source of UART1 to UART2, write the desired source to the file:
> +		echo uart2 > /sys/bus/platform/drivers/starfive-uart-routing/*.uart-routing/uart1
> +
> +		This indicates that UART1 now receives its input from UART2.
> +
> +Users:		OpenBMC.  Proposed changes should be mailed to
> +		openbmc@lists.ozlabs.org
> +
> +What:		/sys/bus/platform/drivers/starfive-uart-routing/\*/io\*
> +Date:		August 2026
> +Contact:	Changhuang Liang <changhuang.liang@starfivetech.com>
> +Description:	Selects the RX source of IOx serial port. The current selection
> +		will be marked by brackets "[]". The list of available options
> +		depends on the selected file.
> +
> +		e.g.
> +		cat /sys/bus/platform/drivers/starfive-uart-routing/\*.uart-routing/io9
> +		uart0 uart1 uart2 uart3 uart4 uart5 uart6 uart7 uart8 [uart9] uart10 uart11 uart12
> +		uart13 uart14 io0 io1 io2 io3 io4 io5 io6 io7 io8 io9 io10 io11 io12 io13 io14
> +
> +		In this case, IO9 (physical serial port 9) gets its input from UART9.
> +
> +		To switch the RX source of IO9 to UART10, write the desired source to the file:
> +		echo uart10 > /sys/bus/platform/drivers/starfive-uart-routing/*.uart-routing/io9
> +
> +		This indicates that IO9 now receives its input from UART10.
> +
> +Users:		OpenBMC.  Proposed changes should be mailed to
> +		openbmc@lists.ozlabs.org

Please consider the following changes to this ABI file documentation
(or make your own).

---
Avoid 'make htmldocs' warnings (from docutils) and
make console input or output be presented more clearly and
in a monospace font.

Documentation/ABI/testing/sysfs-driver-starfive-uart-routing:25: WARNING: Inline emphasis start-string without end-string. [docutils]
Documentation/ABI/testing/sysfs-driver-starfive-uart-routing:1: WARNING: Inline emphasis start-string without end-string. [docutils]

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/ABI/testing/sysfs-driver-starfive-uart-routing |   32 +++++-----
 1 file changed, 18 insertions(+), 14 deletions(-)

--- linux-next-20260902.orig/Documentation/ABI/testing/sysfs-driver-starfive-uart-routing
+++ linux-next-20260902/Documentation/ABI/testing/sysfs-driver-starfive-uart-routing
@@ -1,4 +1,4 @@
-What:		/sys/bus/platform/drivers/starfive-uart-routing/\*/uart\*
+What:		/sys/bus/platform/drivers/starfive-uart-routing/*/uart*
 Date:		August 2026
 Contact:	Changhuang Liang <changhuang.liang@starfivetech.com>
 Description:	Selects the RX source of the UARTx device.
@@ -7,37 +7,41 @@ Description:	Selects the RX source of th
 		selected option marked by brackets "[]". The list of available options
 		depends on the selected file.
 
-		e.g.
-		cat /sys/bus/platform/drivers/starfive-uart-routing/\*.uart-routing/uart1
-		io0 [io1] io2 io3 io4 io5 io6 io7 io8 io9 io10 io11 io12 io13 io14 uart0 uart1
-		uart2 uart3 uart4 uart5 uart6 uart7 uart8 uart9 uart10 uart11 uart12 uart13 uart14
+		E.g.::
+
+		  cat /sys/bus/platform/drivers/starfive-uart-routing/*.uart-routing/uart1
+		  io0 [io1] io2 io3 io4 io5 io6 io7 io8 io9 io10 io11 io12 io13 io14 uart0 uart1
+		  uart2 uart3 uart4 uart5 uart6 uart7 uart8 uart9 uart10 uart11 uart12 uart13 uart14
 
 		In this case, UART1 gets its input from IO1 (physical serial port 1).
 
-		To switch the RX source of UART1 to UART2, write the desired source to the file:
-		echo uart2 > /sys/bus/platform/drivers/starfive-uart-routing/*.uart-routing/uart1
+		To switch the RX source of UART1 to UART2, write the desired source to the file::
+
+		  echo uart2 > /sys/bus/platform/drivers/starfive-uart-routing/*.uart-routing/uart1
 
 		This indicates that UART1 now receives its input from UART2.
 
 Users:		OpenBMC.  Proposed changes should be mailed to
 		openbmc@lists.ozlabs.org
 
-What:		/sys/bus/platform/drivers/starfive-uart-routing/\*/io\*
+What:		/sys/bus/platform/drivers/starfive-uart-routing/*/io*
 Date:		August 2026
 Contact:	Changhuang Liang <changhuang.liang@starfivetech.com>
 Description:	Selects the RX source of IOx serial port. The current selection
 		will be marked by brackets "[]". The list of available options
 		depends on the selected file.
 
-		e.g.
-		cat /sys/bus/platform/drivers/starfive-uart-routing/\*.uart-routing/io9
-		uart0 uart1 uart2 uart3 uart4 uart5 uart6 uart7 uart8 [uart9] uart10 uart11 uart12
-		uart13 uart14 io0 io1 io2 io3 io4 io5 io6 io7 io8 io9 io10 io11 io12 io13 io14
+		E.g.::
+
+		  cat /sys/bus/platform/drivers/starfive-uart-routing/*.uart-routing/io9
+		  uart0 uart1 uart2 uart3 uart4 uart5 uart6 uart7 uart8 [uart9] uart10 uart11 uart12
+		  uart13 uart14 io0 io1 io2 io3 io4 io5 io6 io7 io8 io9 io10 io11 io12 io13 io14
 
 		In this case, IO9 (physical serial port 9) gets its input from UART9.
 
-		To switch the RX source of IO9 to UART10, write the desired source to the file:
-		echo uart10 > /sys/bus/platform/drivers/starfive-uart-routing/*.uart-routing/io9
+		To switch the RX source of IO9 to UART10, write the desired source to the file::
+
+		  echo uart10 > /sys/bus/platform/drivers/starfive-uart-routing/*.uart-routing/io9
 
 		This indicates that IO9 now receives its input from UART10.
 


-- 
~Randy

