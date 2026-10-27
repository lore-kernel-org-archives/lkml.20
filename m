Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117109;
	b=W9ZleKir8hFATcI1km00Fqj89BBqKgYm8kpOGk9hfP+QBtUiWJFliO29KKtVj7qAZFJQ
	 cgSjP2Vi54at7SNUknmPKIiFZevnLqw8WkoffPbjb4NE885SKs2A4bzBdpr2mCpOhRz8P
	 NDb8t7MWRR5F7aAMTyhj53Kgs9WFT/C845+Qkiu/akVFnZePnvE/uK/7tFyunHhingV0L
	 e1d3D4qjcUzrtp/6ceGNQ2hLud/XO4x9DLwRDEc9jsMoZymw8xaAHcHVUWwLXSOxW35Pp
	 Rrc1AAuWR5N/ry9FkWNfRld6+A2O4584qdyhhA9pBsOQKIOJqnFVOqyr89hlehBlE5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117109;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=e/tpKZZCVE5WqWrSniLDPlvpCbD4gjoO6ct5kG9Gs90=;
	b=2nF1kmheIPbYbuIT5a+S5hRv4mrKkKRlxn0Pk5+C9LrIGFPG1M/TuWZGCVWrKRZ2EU3N
	 HCnc6y9+PKeSDs38RAXuTwSY877axxgE3gPc8Q11sMhXbAlyJsf+ljyOXyqplQ3lKzPi5
	 PdM4Q5fUKHh63W719PJdDlimldnm1RyCpA9NPdB+EitHIvpbOJF/6EqAUj/xP/VjZvQDL
	 ywHzUs2wkJF6qePmzAL6p93o0Obz7+QqyGwpRncmXKW7wv23nL4zaHGDQHuTs+qq6IIIY
	 K15v0lUZNTm94jzAEBhTCgm4QvlotAIlbRkcEMI21m3ZNUcenZfWfRZHknifJaV48+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=2aTnw5ue;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B4860A382C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=2aTnw5ue
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF2E1F01300;
	Tue, 27 Oct 2026 16:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793117109;
	bh=e/tpKZZCVE5WqWrSniLDPlvpCbD4gjoO6ct5kG9Gs90=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=2aTnw5ue5DHg/nUDGN79tGWoVSQN1K3rqPHc2/cEbzJievNxdEbR/UOg1rk572Y30
	 vH87CTr5NWPIwZm8o7lJm60M68E4BQvV8dx3F/dQ61KaEJQK2MRZhBcBHI3q7zpKHM
	 jdpHE67QxgONNWngw7JF1mDAjc8d2Vd7b6uLiZls=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 17:04:42 +0100
Subject: [PATCH 9/9] w1: w1_therm: leave the slaves of other families alone
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-llm-char-misc-w1-v1-9-d2e6bfafb6a4@linuxfoundation.org>
References: <20261027-llm-char-misc-w1-v1-0-d2e6bfafb6a4@linuxfoundation.org>
In-Reply-To: <20261027-llm-char-misc-w1-v1-0-d2e6bfafb6a4@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@kernel.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=4055;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=bmy2TEw33VcOkKqk+Vflc/dBhP8nki+6sSqASV2YASQ=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPTs902XrpdNNtr1tzg2r/GTl+6Hi/0v3vlIXLk1LU6
 wsVMgMvdsSyMAgyMciKKbJ82cZzdH/FIUUvQ9vTMHNYmUCGMHBxCsBEbvMzzA9aKBzuP8t9CQP7
 Wn6TljjjO8HvoxgW3JykKfLA8fjt40cSuc8cDY3L3uMvDgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

The file therm_bulk_read belongs to the bus master.  Its callbacks walk
all the slaves of the bus and look at sl->family_data as if every slave
were a temperature sensor.  A 1-wire bus can carry other devices too:

- The family data of a slave which is driven by another driver, such as
  w1_ds2433, w1_ds250x, w1_ds28e04 or w1_ds28e17, is a structure of that
  driver.  bulk_read_support() takes whatever is at the offset of
  specific_functions for a pointer and dereferences it, and if the
  result happens not to be 0, the callbacks write the state of the
  conversion into that foreign structure.

- For a slave without family data, which is the case for most of the
  other drivers and for the default family, trigger_bulk_read() gives up
  with -ENODEV.  A single serial number chip on the bus is enough to
  make the bulk read unusable for all the sensors.

Only look at the slaves whose family is one of ours.  A bulk conversion
now works on a bus with other devices.

Fixes: 57c76221d5af ("w1_therm: adding bulk read support to trigger multiple conversion on bus")
Cc: stable <stable@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/w1/slaves/w1_therm.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/w1/slaves/w1_therm.c b/drivers/w1/slaves/w1_therm.c
index 6db0b534b338..d8751b29f420 100644
--- a/drivers/w1/slaves/w1_therm.c
+++ b/drivers/w1/slaves/w1_therm.c
@@ -906,6 +906,19 @@ static inline bool bulk_read_support(struct w1_slave *sl)
 	return false;  /* No device family */
 }
 
+/**
+ * bulk_read_slave() - check if a slave of the bus takes part in a bulk read
+ * @sl: any slave on the list of the master
+ *
+ * The family data of the slaves of other families is none of our business.
+ *
+ * Return: true if it is one of our devices and supports bulk read
+ */
+static bool bulk_read_slave(struct w1_slave *sl)
+{
+	return device_family(sl) && sl->family_data && bulk_read_support(sl);
+}
+
 /**
  * conversion_time() - get the Tconv for the slave
  * @sl: device to get the conversion time
@@ -1497,9 +1510,7 @@ static int trigger_bulk_read(struct w1_master *dev_master)
 	 */
 	mutex_lock(&dev_master->list_mutex);
 	list_for_each_entry(sl, &dev_master->slist, w1_slave_entry) {
-		if (!sl->family_data)
-			goto error;
-		if (bulk_read_support(sl)) {
+		if (bulk_read_slave(sl)) {
 			int t_cur = conversion_time(sl);
 
 			t_conv = max(t_cur, t_conv);
@@ -1539,7 +1550,7 @@ static int trigger_bulk_read(struct w1_master *dev_master)
 			mutex_lock(&dev_master->list_mutex);
 			list_for_each_entry(sl,
 				&dev_master->slist, w1_slave_entry) {
-				if (bulk_read_support(sl))
+				if (bulk_read_slave(sl))
 					SLAVE_CONVERT_TRIGGERED(sl) = -1;
 			}
 			mutex_unlock(&dev_master->list_mutex);
@@ -1570,7 +1581,7 @@ static int trigger_bulk_read(struct w1_master *dev_master)
 	/* set a flag to register convsersion is done */
 	mutex_lock(&dev_master->list_mutex);
 	list_for_each_entry(sl, &dev_master->slist, w1_slave_entry) {
-		if (bulk_read_support(sl))
+		if (bulk_read_slave(sl))
 			SLAVE_CONVERT_TRIGGERED(sl) = 1;
 	}
 	mutex_unlock(&dev_master->list_mutex);
@@ -1940,16 +1951,14 @@ static ssize_t therm_bulk_read_show(struct device *device,
 
 	mutex_lock(&dev_master->list_mutex);
 	list_for_each_entry(sl, &dev_master->slist, w1_slave_entry) {
-		if (sl->family_data) {
-			if (bulk_read_support(sl)) {
-				if (SLAVE_CONVERT_TRIGGERED(sl) == -1) {
-					ret = -1;
-					goto show_result;
-				}
-				if (SLAVE_CONVERT_TRIGGERED(sl) == 1)
-					/* continue to check other slaves */
-					ret = 1;
+		if (bulk_read_slave(sl)) {
+			if (SLAVE_CONVERT_TRIGGERED(sl) == -1) {
+				ret = -1;
+				goto show_result;
 			}
+			if (SLAVE_CONVERT_TRIGGERED(sl) == 1)
+				/* continue to check other slaves */
+				ret = 1;
 		}
 	}
 show_result:

-- 
2.56.0

